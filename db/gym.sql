DROP TABLE classes;
DROP TABLE memberships;
DROP TABLE humans;

CREATE TABLE humans
(
  id SERIAL primary key,
  first_name VARCHAR(255),
  surname VARCHAR(255),
  age VARCHAR(255)
);

CREATE TABLE memberships
(
  id SERIAL primary key,
  price INT,
  human_id INT REFERENCES humans(id) ON DELETE CASCADE 
);

CREATE TABLE classes
(
  id SERIAL primary key,
  name VARCHAR(255),
  time VARCHAR(255),
  humans_id INT REFERENCES humans(id),
  membership_id INT REFERENCES memberships(id)
);
