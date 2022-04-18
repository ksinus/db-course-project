--- 1 Обновляем цену на объявлении и проверяем работу триггера, хранящего историю цены
UPDATE adverts
SET price_amt = price_amt * 2
WHERE advert_id = '10';

--- 2 Добавляем объявление
INSERT INTO adverts(advert_title, advert_desc, category_id, author_id, price_amt)
VALUES ('Кошка', 'Толстая и пушистая. Не продаётся, я просто хвастаюсь.', 1, 1, 100);

--- 3 Проверяем работу триггера на удаление пользователя
--- Должны удалиться как избранные, так и объявления пользователя
--- так и избранные
DELETE
FROM users
WHERE user_id = 10;

---4 Создаём пользователя
INSERT INTO users(user_nm, user_last_n, user_birth_dt, mobile_phone_no, email_no)
VALUES ('Николай', 'Кутузов', '2004-04-04', '79198889922', 'nik.kut@ya.ru');

---5 Добавляем объявление в избранное
INSERT INTO favorites
VALUES ((SELECT user_id
         FROM users
         WHERE mobile_phone_no = '79198889922'),
        (SELECT advert_id
         FROM adverts
         WHERE advert_title = 'Кошка'));

---6 Выбираем всех пользователей, которые родились в 2004 году
SELECT user_nm, user_last_n
FROM users
WHERE date_part('year', user_birth_dt) = 2004;

---7 Меняем номер телефона пользователя
UPDATE users
SET mobile_phone_no = '79198889955'
WHERE user_id = (SELECT user_id
                 FROM users
                 WHERE mobile_phone_no = '79198889922');

---8 Получаем название категории по её id
SELECT category_title
FROM categories
WHERE category_id = 1;

---9 Находим все объявления, где встречается слово 'гараж' в названии
SELECT advert_id
FROM adverts
WHERE POSITION('гараж' IN advert_title) > 0;

---10 Выбираем все объявления, которые были созданы пользователями старше 2004 года рождения
SELECT advert_id
FROM adverts
JOIN users ON users.user_id = adverts.author_id
WHERE date_part('year', user_birth_dt) < 2004;

