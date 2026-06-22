CREATE DATABASE IF NOT EXISTS appdb;
USE appdb;

CREATE TABLE IF NOT EXISTS user(
  id INT PRIMARY KEY,
  name VARCHAR(50),
  bio VARCHAR(200),
  github VARCHAR(150),
  leetcode VARCHAR(150),
  friend VARCHAR(50)
);

INSERT INTO user VALUES
(1, "dummy", "no bio", "github", "leetcode", "friend");
