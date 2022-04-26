--
-- partial('abcdefgh',1,'xxxx',3) will return 'axxxxfgh';
--
CREATE OR REPLACE FUNCTION partial(
    ov TEXT,
    prefix INT,
    padding TEXT,
    suffix INT
)
    RETURNS TEXT AS
$$
SELECT substring(ov FROM 1 FOR prefix)
           || padding
           || substring(ov FROM (length(ov) - suffix + 1) FOR suffix);
$$
    LANGUAGE SQL IMMUTABLE
                 SECURITY INVOKER;

CREATE OR REPLACE FUNCTION partial_email(
    ov TEXT
)
    RETURNS TEXT AS
$$
SELECT substring(regexp_replace(ov, '@.*', '') FROM 1 FOR 2)
           || '***'
           || '@'
           || substring(regexp_replace(ov, '.*@', '') FROM 1 FOR 2)
           || '***'
           || '.'
           || regexp_replace(ov, '.*\.', '')
    ;
$$
    LANGUAGE SQL IMMUTABLE
                 SECURITY INVOKER;


--- 1 Смотрим на клиента, возрастную + все объявления с ценами, что у него есть
CREATE OR REPLACE VIEW client_adverts AS
SELECT user_id, user_birth_dt, advert_id, price_amt
FROM Users
         JOIN Adverts ON author_id = user_id;

--- 2 Скроем персональные данные клиента: email
CREATE OR REPLACE VIEW hideEmail AS
SELECT user_id,
       partial_email(email_no::text)
FROM Users;

--- 3 Скроем персональные данные клиента: имя и фамилию
CREATE OR REPLACE VIEW hideName AS
SELECT user_id,
       partial(user_nm::text,
               1,
               repeat('*', length(user_nm::text) - 2),
               1) as user_nm,
       partial(user_last_n::text,
               1,
               repeat('*', length(user_last_n::text) - 2),
               1) as user_last_n
FROM Users;

--- 4 Скроем персональные данные клиента: номер карты
CREATE OR REPLACE VIEW hideCardNo AS
SELECT user_id,
       partial(card_no::text,
               4,
               repeat('*', length(card_no::text) - 8),
               4) as card_no
FROM Users;

--- 5 Скроем персональные данные клиента: номер телефона
CREATE OR REPLACE VIEW hidePhoneNo AS
SELECT user_id,
       partial(mobile_phone_no::text,
               4,
               repeat('*', length(mobile_phone_no::text) - 6),
               2) as mobile_phone_no
FROM Users;

--- 6 Автор + названия его объявления
CREATE OR REPLACE VIEW autorAdverts AS
SELECT user_nm,
       user_last_n,
       advert_title
FROM Users
         JOIN Adverts ON author_id = user_id;