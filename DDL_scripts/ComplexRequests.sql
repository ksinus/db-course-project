/* GROUP BY + HAVING
Хочу получить для каждого автора объявления, цены которых суммарно больше 5000 рублей. */
SELECT author_id, advert_id
FROM Users
         JOIN Adverts ON author_id = user_id
GROUP BY author_id, advert_id
HAVING SUM(price_amt) > 5000;


/* ORDER BY
Хочу получить объявления для каждого из пользователей по дате создания */
SELECT author_id, advert_id
FROM Users
         JOIN Adverts ON author_id = user_id
GROUP BY author_id, advert_id, advert_dt
ORDER BY author_id, advert_dt DESC;


/* OVER + PARTITION BY
Вывожу, каким по номеру является объявление автора */
SELECT author_id,
       advert_id,
       ROW_NUMBER() OVER (PARTITION BY author_id, advert_dt) as advert_no
FROM Users
         JOIN Adverts ON author_id = user_id
ORDER BY author_id;


/* OVER + ORDER BY
Вывожу, каким по счёту зарегистрировался пользователь */
SELECT user_id, ROW_NUMBER() OVER (ORDER BY register_dt)
FROM users;


/* OVER + ORDER BY + PARTITION BY
Вывожу порядок, в котором устанавливались цены объявлений */
SELECT advert_id, price_amt, ROW_NUMBER() OVER (PARTITION BY advert_id ORDER BY advert_dt)
FROM advert_price_history;


/* 3 вида функций
    Показывает автора объявления,
    среднюю цену его объявлений,
    каким по счёту идёт конкретное объявление,
    самую низкую цену по категории */
SELECT author_id,
       category_id,
       ROW_NUMBER() OVER (PARTITION BY author_id ORDER BY advert_dt)                  as advert_no,
       AVG(price_amt) OVER (PARTITION BY author_id)                                   as mean_price,
       FIRST_VALUE(price_amt) OVER (PARTITION BY category_id ORDER BY price_amt DESC) as min_price
FROM adverts
         JOIN users ON author_id = user_id;
