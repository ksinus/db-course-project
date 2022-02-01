DO
$do$
    BEGIN
        FOR i IN 1..25
            LOOP
                INSERT INTO Users (user_nm, user_last_n, user_birth_dt, mobile_phone_no, email_no, card_num)
                VALUES ('Иван',
                        'Иванов',
                        '2001-09-28',
                        800080 + i,
                        concat(i, 'test@mail.ru'),
                        987000 + i);
            END LOOP;
    END
$do$;
