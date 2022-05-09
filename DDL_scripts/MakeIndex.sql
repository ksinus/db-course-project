/*
Создадим индекс по выражению lower(title),
которое позволяет эффективно выполнять регистронезависимый поиск
*/
CREATE INDEX IF NOT EXISTS searchByTitle ON adverts ((lower(advert_title))) ;
/*
Создадим индекс по айди пользователя, чтобы быстрее получать
группу избранных для выдачи
*/
CREATE INDEX IF NOT EXISTS favoritesByUser ON favorites (user_id);
/*
Создадим индекс, поддерживающий сортировку имён пользователей в алфавитном
порядке, что позволит быстрее искать человека по ФИО
*/
CREATE INDEX IF NOT EXISTS sortByUsers ON users (user_nm, user_last_n DESC);
