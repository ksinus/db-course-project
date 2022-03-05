# Задание 1

Пусть заданы следующие отношения:  

**Продукт (атрибуты: производитель, модель, тип продукта):**  
`P(MK, #MD, TP); TP ∈ {'PC', 'Tablet', 'Printer'}`  
**Персональный компьютер (атрибут: код, модель, тактовая частота, оперативная память, объем жесткого диска, цена):**  
`PC(#PC, MD, SPD, RAM, HD, PRC);`  
**Планшет (атрибуты: код, модель, тактовая частота, оперативная память, объем жесткого диска, экран, цена):**  
`TB(#TB, MD, SPD, RAM, HD, SCR, PRC);`  
**Принтер (атрибуты: код, модель, цвет, цена):**  
`PR(#PR, MD, CLT, PRC); CLR ∈ {'Y', 'N'}.`  


На языке реляционной алгебры написать следующие запросы:
1. Найти все кортежи отношения Принтер для цветных принтеров  
```
SELECT *
FROM PR
WHERE CLT = 'Y'
```
2. Найти всех производителей принтеров  
```
SELECT MK
FROM P
WHERE P.TP = 'Printer'
GROUP BY MK;
```
3. Найти номер модели, частоту и объем жесткого диска для всех ПК стоимостью менее 500 дол.
```
SELECT MD, SPD, HD
FROM PC
WHERE PRC < 500;
```
4. Найти номер модели, объем оперативной памяти и размеры экранов планшетов, цена которых превышает 1000 дол.
```
SELECT MD,
       RAM,
       SCR
FROM TB
WHERE PRC > 1000;
```
5. Найти номер модели, частоту и объем жесткого диска ПК с оперативной памятью 2ГБ и ценой менее 600 дол.
```
SELECT PC.MD,
       PC.SPD,
       PC.HD
FROM PC
WHERE PC.RAM = 2
  AND PC.PRC < 600;
```
6. Найти производителей ПК с частотой не менее 450 МГц
```
SELECT DISTINCT P.MK
FROM PC
INNER JOIN P ON PC.MD = P.MD
WHERE PC.SPD >= 450
```
7. Для каждого производителя, выпускающего планшеты c объёмом жесткого диска не менее 10 ГБ, найти скорости таких планшетов
```
SELECT DISTINCT P.MK, TB.SPD
FROM TB
JOIN P ON P.MD = TB.MD
WHERE TB.HD >= 10
```
8. Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя ’B’
```
SELECT DISTINCT P.MD,
                PC.PRC
FROM P
JOIN PC ON P.MD = PC.MD
WHERE P.MK = 'B'
UNION
SELECT DISTINCT P.MD,
                TB.PRC
FROM P
JOIN TB ON P.MD = TB.MD
WHERE P.MK = 'B'
UNION
SELECT DISTINCT P.MD,
                PR.PRC
FROM P
JOIN PR ON P.MD = PR.MD
WHERE P.MK = 'B'
```
9. Найти производителей, которые выпускают ПК или планшеты с объемом оперативной памяти не менее 2ГБ
```
SELECT DISTINCT P.MK
FROM P
WHERE P.TP = 'PC'
UNION
SELECT DISTINCT P.MK
FROM TB
JOIN P ON P.MD = TB.MD
WHERE TB.RAM >= 2
```
10. Найдите производителей, выпускающих ПК, но не планшеты
```
SELECT DISTINCT P.MK
FROM P
WHERE P.TP = 'PC'
EXCEPT
SELECT DISTINCT P.MK
FROM P
WHERE P.TP = 'Tablet'
```
11. Найдите производителей, которые выпускают как ПК, так и планшеты
```
SELECT DISTINCT P.MK
FROM P
WHERE P.TP = 'PC'
INTERSECT
SELECT DISTINCT P.MK
FROM P
WHERE P.TP = 'Tablet'
```
12. Найти производителей, которые выпускают только принтеры, причем цветные  
Найдем производителей, которые производят только принтеры, и из них уберём производителей, среди моделей которых принтеров которых есть хотя бы одна чёрно-белая:
```
SELECT DISTINCT P.MK
FROM P
GROUP BY MK
HAVING COUNT(DISTINCT TP) = 1
AND min(TP) = 'Printer'
EXCEPT
SELECT DISTINCT P.MK
FROM PR
JOIN P ON P.MD = PR.MD
WHERE PR.CLR = 'N'
```
13. Найдите производителей, которые выпускают все планштеты с оперативной памятью 16 ГБ
```
```
