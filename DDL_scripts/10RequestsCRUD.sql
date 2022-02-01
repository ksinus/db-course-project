--- 1 Обновляем цену на объявлении и проверяем работу триггера, хранящего историю цены
UPDATE adverts
SET price_amt = price_amt * 2
WHERE advert_id = '10';

--- 2 Делаем объявление
INSERT INTO adverts(advert_title, advert_desc, category_id, author_id, price_amt)
VALUES ('Кошка', 'Толстая и пушистая. Не продаётся, я просто хвастаюсь.', 1, 1, 100);

--- 3 Проверяем работу триггера на удаление пользователя
DELETE
FROM users
WHERE user_id = 10;

---4

---5

---6

---7

---8

---9

---10

