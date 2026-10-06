CREATE TABLE departments (
  department_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE people ADD department_id INT UNSIGNED AFTER email;

INSERT INTO departments (name)
VALUES
  ('営業'),
  ('開発'),
  ('経理'),
  ('人事'),
  ('情報システム');

  INSERT INTO people (name, email, department_id, age, gender)
VALUES
  ('山田太郎', 'yamada@example.com', 1, 25, 1),
  ('藤代 花子', 'hujishiro@example.com', 1, 24, 2),
  ('田中 清子', 'tanaka@example.com', 1, 30, 2),
  ('佐藤 清隆', 'sato@example.com', 2, 22, 1),
  ('名取 なり', 'natori@example.com', 2, 22, 2),
  ('野比のび太', 'nobi@example.com', 2, 25, 1),
  ('骨川スネ夫', 'honekawa@example.com', 2, 25, 1),
  ('川島琴葉', 'kawasima@example.com', 2, 26, 2),
  ('佐々木 一', 'sasaki@example.com', 3, 28, 1),
  ('高田 成史', 'takada@example.com', 4, 30, 1),
  ('佐久間 くま', 'sakuma@example.com', 5, 25, 2);

UPDATE people SET department_id = 2 WHERE person_id IN (1, 2, 3);
UPDATE people SET department_id = 3 WHERE person_id IN (4);
UPDATE people SET department_id = 4 WHERE person_id IN (6);

SELECT name, age FROM people WHERE gender = 1 ORDER BY age DESC;

people テーブルから、department_id カラムの値が1のレコードを降順で並び替えて、name・email・age カラムを表示する。

SELECT name, age FROM people WHERE (age BETWEEN 20 AND 29 AND gender = 2) OR (age BETWEEN 40 AND 49 AND gender = 1);

SELECT p.name, p.age FROM people p JOIN departments d ON p.department_id = d.department_id WHERE d.name = '営業' ORDER BY p.age;

SELECT AVG(p.age) AS average_age FROM people p JOIN departments d ON p.department_id = d.department_id WHERE d.name = '開発' AND p.gender = 2;

SELECT p.name, d.name, r.content FROM people p JOIN departments d ON p.department_id = d.department_id JOIN reports r ON p.person_id = r.person_id;

SELECT p.nameFROM people pLEFT JOIN reports r ON p.person_id = r.person_idWHERE r.person_id IS NULL;
