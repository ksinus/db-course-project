--- Сохраняет историю изменений цены
CREATE OR REPLACE FUNCTION insert_price_to_history()
    RETURNS trigger AS
$$
BEGIN
    --- если изменяем текущую
    IF NEW.price_amt <> OLD.price_amt THEN
        INSERT INTO advert_price_history(advert_id, price_amt, advert_dt)
        VALUES (OLD.advert_id, OLD.price_amt, OLD.advert_dt);
    END IF;
    --- если запись только создаётся
    IF OLD.price_amt IS NULL THEN
        INSERT INTO advert_price_history(advert_id, price_amt, advert_dt)
        VALUES (NEW.advert_id, NEW.price_amt, NEW.advert_dt);
    END IF;
    RETURN NEW;
END;
$$
    LANGUAGE 'plpgsql';

CREATE TRIGGER save_price_to_history
    BEFORE INSERT OR UPDATE
    ON adverts
    FOR EACH ROW
EXECUTE PROCEDURE insert_price_to_history();

--- При удалении пользователя так же удаляются все его избранные и объявления
CREATE OR REPLACE FUNCTION clear_user_data()
    RETURNS trigger AS
$$
BEGIN
    --- удаляю объявление пользователя из избранных других клиентов
    DELETE
    FROM favorites F
        USING adverts A
    WHERE A.author_id = OLD.user_id
      AND A.advert_id = F.advert_id;

    --- удаляю сами объявления
    DELETE
    FROM adverts
    WHERE author_id = OLD.user_id;

    --- удаляю избранные пользователя
    DELETE
    FROM favorites
    WHERE favorites.user_id = OLD.user_id;

    RETURN OLD;
END;
$$
    LANGUAGE 'plpgsql';

CREATE TRIGGER clear_user_data
    BEFORE DELETE
    ON users
    FOR EACH ROW
EXECUTE PROCEDURE clear_user_data();