CREATE TABLE IF NOT EXISTS Users
(
    user_id         SERIAL      NOT NULL UNIQUE PRIMARY KEY,
    user_nm         VARCHAR(20) NOT NULL,
    user_last_n     VARCHAR(20) NOT NULL,
    user_birth_dt   DATE,
    mobile_phone_no VARCHAR(20) UNIQUE,
    email_no        VARCHAR(20) UNIQUE,
    card_no         VARCHAR(40) DEFAULT NULL,
    register_dt     DATE DEFAULT now()::date
);

CREATE TABLE IF NOT EXISTS Adverts
(
    advert_id    SERIAL  NOT NULL UNIQUE PRIMARY KEY,
    advert_title VARCHAR(20),
    advert_desc  VARCHAR(350),
    category_id  INTEGER NOT NULL,
    advert_dt    DATE DEFAULT now()::date,
    author_id    INTEGER NOT NULL,
    price_amt    INTEGER
);

CREATE TABLE IF NOT EXISTS Categories
(
    category_id    INTEGER     NOT NULL,
    category_title VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS Advert_price_history
(
    advert_id INTEGER,
    price_amt INTEGER,
    advert_dt DATE DEFAULT now()::date
);

CREATE TABLE IF NOT EXISTS Favorites
(
    advert_id INTEGER NOT NULL,
    user_id   INTEGER NOT NULL
);
