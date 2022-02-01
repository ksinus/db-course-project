DO
$do$
    BEGIN
        FOR i IN 1..50
            LOOP
                INSERT INTO favorites(advert_id, user_id)
                VALUES (floor(random() * (25 - 1)) + 1, floor(random() * (25 - 1)) + 1);
            END LOOP;
    END
$do$;
