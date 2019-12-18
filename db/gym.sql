DROP TABLE memberships;
DROP TABLE sessions;
DROP TABLE humans;

CREATE TABLE humans
(
  id SERIAL primary key,
  first_name VARCHAR(255),
  surname VARCHAR(255),
  age VARCHAR(255)
);

CREATE TABLE sessions
(
  id SERIAL primary key,
  name VARCHAR(255),
  time VARCHAR(255),
  human_id INT REFERENCES humans(id) ON DELETE CASCADE
);

CREATE TABLE memberships
(
  id SERIAL primary key,
  price INT,
  human_id INT REFERENCES humans(id) ON DELETE CASCADE,
  session_id INT REFERENCES sessions(id) ON DELETE CASCADE
);
