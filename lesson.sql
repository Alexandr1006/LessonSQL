
                                          Список баз данных
    Имя    | Владелец | Кодировка |     LC_COLLATE      |      LC_CTYPE       |     Права доступа
-----------+----------+-----------+---------------------+---------------------+-----------------------
 postgres  | postgres | UTF8      | Russian_Russia.1251 | Russian_Russia.1251 |
 skypro    | postgres | UTF8      | Russian_Russia.1251 | Russian_Russia.1251 |
 template0 | postgres | UTF8      | Russian_Russia.1251 | Russian_Russia.1251 | =c/postgres          +
           |          |           |                     |                     | postgres=CTc/postgres
 template1 | postgres | UTF8      | Russian_Russia.1251 | Russian_Russia.1251 | =c/postgres          +
           |          |           |                     |                     | postgres=CTc/postgres
(4 строки)


postgres=# \c skypro
Вы подключены к базе данных "skypro" как пользователь "postgres".
skypro=# CREATE TABLE employee (
    skypro(# id BIGSERIAL NOT NULL PRIMARY KEY,
        skypro(# first_name VARCHAR(50) NOT NULL,
        skypro(# last_name VARCHAR(50) NOT NULL,
        skypro(# gender VARCHAR(6) NOT NULL,
        skypro(# age INT NOT NULL
        skypro(# );
CREATE TABLE
    skypro=# SELECT * FROM employee
    skypro-# SELECT * FROM employee;
ОШИБКА:  ошибка синтаксиса (примерное положение: "SELECT")
СТРОКА 2: SELECT * FROM employee;
^
skypro=# SELECT * FROM employee;
id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
(0 строк)


skypro=# INSERT INTO employee (
skypro(# first_name, last_name, gender, age)
skypro-# VALUES ('Alexandr', 'Popov', 'man', 28);
INSERT 0 1
skypro=# VALUES ('Konstantin', 'Ivanov', 'man', 20);
  column1   | column2 | column3 | column4
------------+---------+---------+---------
 Konstantin | Ivanov  | man     |      20
(1 строка)


skypro=# INSERT INTO employee (
skypro(#  first_name, last_name, gender, age)
skypro-#  VALUES ('Alexandr', 'Popov', 'man', 28);
INSERT 0 1
skypro=# SELECT * FROM  employee
skypro-# SELECT * FROM  employee;
ОШИБКА:  ошибка синтаксиса (примерное положение: "SELECT")
СТРОКА 2: SELECT * FROM  employee;
          ^
skypro=# SELECT * FROM  employee;
 id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  1 | Alexandr   | Popov     | man    |  28
  2 | Alexandr   | Popov     | man    |  28
(2 строки)

skypro=# INSERT INTO employee (
skypro(# first_name, last_name, gender, age)
skypro-# VALUES ('Konstantin', 'Ivanov', 'man', 20);
INSERT 0 1
skypro=# SELECT * FROM  employee;
 id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  1 | Alexandr   | Popov     | man    |  28
  2 | Alexandr   | Popov     | man    |  28
  3 | Konstantin | Ivanov    | man    |  20
(3 строки)


skypro=# UPDATE employee SET first_name = 'Petr', last_name = 'Petrov', gender = 'woman', age = '19'WHERE id = 2;
UPDATE 1
skypro=# SELECT * FROM employee;
 id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  1 | Alexandr   | Popov     | man    |  28
  3 | Konstantin | Ivanov    | man    |  20
  2 | Petr       | Petrov    | woman  |  19
(3 строки)


skypro=# DELETE FROM employee WHERE id = 1;
DELETE 1
skypro=# SELECT * FROM employee;
 id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  3 | Konstantin | Ivanov    | man    |  20
  2 | Petr       | Petrov    | woman  |  19
(2 строки)


skypro=#