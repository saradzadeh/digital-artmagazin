CREATE DATABASE project2_db;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email TEXT,
  password_digest TEXT
);


CREATE TABLE images (
  id SERIAL PRIMARY KEY,
  name VARCHAR(200),
  image_url TEXT,
  description TEXT,
  user_id INTEGER
);

INSERT INTO images (name, image_url, description, user_id) VALUES ('Alyssa Monks', 'https://images.squarespace-cdn.com/content/v1/549b9edce4b0a47d0addf875/1420423420867-PUAZFODOL3IXX4JED4IV/ke17ZwdGBToddI8pDm48kPg3kkMSlDqGprD-21e6kCJZw-zPPgdn4jUwVcJE1ZvWQUxwkmyExglNqGp0IvTJZamWLI2zvYWH8K3-s_4yszcp2ryTI0HqTOaaUohrI8PIpppx-FWaxK7i6rVdWZNGy6SGN0ZVlswpj22aI6j1zesKMshLAGzx4R3EDFOm1kBS/1.jpg?format=1000w', 'New York City has so much character and grit I don’t know anywhere else quite like it. Not sure where else I’d really belong, although I could live a year almost anywhere I think.', 1);

