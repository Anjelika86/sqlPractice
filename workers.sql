DROP TABLE workers;
CREATE TABLE workers (
  id serial PRIMARY KEY,
  worker_name varchar(64) NOT NULL CHECK(worker_name != ''),
  birthday date NOT NULL CHECK(
    birthday > '1945-1-1'
    AND birthday < current_date
  ),
  salary numeric(10, 2) NOT NULL CHECK(salary > 0)
);
INSERT INTO workers (worker_name, birthday, salary)
VALUES ('Nikita', '1990/1/1', 300);
INSERT INTO workers (worker_name, birthday, salary)
VALUES ('Svetlana', '1990/2/1', 1200);
INSERT INTO workers (worker_name, birthday, salary)
VALUES ('Yaroslava', '1980/1/1', 1200),
  ('Petro', '1993/1/1', 1000),
  ('Vasiliy', '1989/1/1', 500),
  ('Evgeniy', '1998/2/3', 500);
INSERT INTO workers (worker_name, birthday, salary)
VALUES ('Nikolay', '1997/2/1', 1200);
UPDATE workers
SET salary = 200
WHERE worker_name = 'Vasiliy';
UPDATE workers
SET birthday = '1987/1/1'
WHERE id = 4;
UPDATE workers
SET salary = 700
WHERE salary = 500;
UPDATE workers
SET birthday = '1999/1/1'
WHERE id > 2
  AND id <= 5;
UPDATE workers
SET worker_name = 'Evgeniy',
  salary = 900
WHERE worker_name = 'Vasiliy';
SELECT *
FROM workers
WHERE id = 3;
SELECT *
FROM workers
WHERE salary > 400;
SELECT *
FROM workers
WHERE salary != 500;
SELECT salary,
  extract(
    YEAR
    FROM age(birthday)
  ) AS "Age"
FROM workers
WHERE worker_name = 'Evgeniy';
SELECT *
FROM workers
WHERE worker_name = 'Petro';
SELECT *
FROM workers
WHERE worker_name != 'Petro';
SELECT *
FROM workers
WHERE (
    extract(
      YEAR
      FROM age(birthday)
    ) = 27
  )
  OR(salary = 1000);
SELECT *
FROM workers
WHERE extract(
    YEAR
    FROM age(birthday)
  ) > 25
  AND extract(
    YEAR
    FROM age(birthday)
  ) <= 28;
SELECT *
FROM workers
WHERE (
    extract(
      YEAR
      FROM age(birthday)
    ) > 23
    AND extract(
      YEAR
      FROM age(birthday)
    ) < 27
  )
  OR (
    salary > 400
    AND salary < 1000
  )
ORDER BY id;
SELECT *
FROM workers
WHERE extract(
    YEAR
    FROM age(birthday)
  ) = 27
  OR salary != 400
ORDER BY id;
DELETE FROM workers
WHERE id = 7;
DELETE FROM workers
WHERE worker_name = 'Nikolay';
DELETE FROM workers
WHERE extract(
    YEAR
    FROM age(birthday)
  ) = 23;