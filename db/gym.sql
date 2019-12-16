DROP TABLE classes;
DROP TABLE memberships;
DROP TABLE humans;

CREATE TABLE memberships
(
  id SERIAL PRIMARY KEY,
  price INT,
);

CREATE TABLE humans
(
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  surname VARCHAR(255)
);

CREATE TABLE Classes
(
  id SERIAL PRIMARY KEY,
  membership_id INT REFERENCES memberships(id),
  humans_id INT REFERENCES humans(id)
);
