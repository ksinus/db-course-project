# Проект по курсу Базы данных ФПМИ

## Тема: Сервис хранения информации об объявлениях.

Моделирование базы данных для сайта объявлений (e.g. Авито, Юла).

## Запуск

Сервер с базой данных находится в Docker-контейнере, из которого выставлен порт 5050. Вся конфигурацию прописана в
Dockerfile-compose файле. Из директории с файлом:

Запуск: ``docker-compose up ``

Подключение к контейнеру: ``напишу позже``

Завершение работы: `` docker-compose down ``

## Концептуальная модель
![](./pic/concept_model.svg)
## Логическая модель

## Физическая модель

#### Users
| Field name | Description | Data type | Restrictions |
|---|---|---|---| 
| user_id | user`s ID | SERIAL |  |
| user_nm |  user`s name | VARCHAR(20) |  |
| user_last_nm | user`s lastname | VARCHAR(20) | |
| user_birth_dt | user`s lastname | DATE | |
| mobile_phone_no | user`s phone number | INTEGER | |
| email_no | user`s email address |  VARCHAR(40) | |
| card_no | user`s card number |  VARCHAR(40) | |

#### Adverts
| Field name | Description | Data type | Restrictions |
|---|---|---|---| 
| advert_id | advert`s ID | SERIAL | |
| advert_title | title | VARCHAR(20) | |
| advert_desc | description  | VARCHAR(350) | |
| category_id | ID Category of the advert  | VARCHAR(20) | |
| advert_dt | date of creation | DATE |
| author_id | ID of the author | INTEGER | |

#### Categories
| Field name | Description | Data type | Restrictions |
|---|---|---|---| 
| category_id | category`s ID | INTEGER | |
| category_title | title | VARCHAR(20) | |

#### Favorites
| Field name | Description | Data type | Restrictions |
|---|---|---|---| 
| advert_id | advert`s ID | INTEGER | |
| user_id | user`s ID | INTEGER |  |

#### Advert_price_history
| Field name | Description | Data type | Restrictions |
|---|---|---|---| 
| advert_id | advert`s ID | INTEGER | |
| price_amt | advert`s price | INTEGER | |
| advert_dt | price setting day | DATE | |

## Выполнение технического задания по проекту

1. См 
2. См
3. Папка DDL_scripts
4. Файлы вида Fill*.sql
5. Файлы вида 10*.sql
6. Файл RequestHard.sql
7. MakeIndexes
8. Представления
9. Процедуры
10. Триггеры
