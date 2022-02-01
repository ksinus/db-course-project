DO
$do$
    BEGIN
        FOR i IN 1..25
            LOOP
                INSERT INTO Adverts (advert_title, advert_desc, category_id, author_id, price_amt)
                VALUES ('Продаю гараж',
                        'Очень срочно продаю!!!',
                        10,
                        floor(random() * (25 - 1)) + 1,
                        100);
            END LOOP;
    END
$do$;
