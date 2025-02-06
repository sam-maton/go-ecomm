-- +goose Up
-- +goose StatementBegin
CREATE TYPE gender AS ENUM ('men', 'women', 'unisex');
CREATE TABLE categories(
  id SERIAL PRIMARY KEY,
  gender gender NOT NULL,
  main_category VARCHAR(255) NOT NULL,
  sub_category VARCHAR(255) NOT NULL,
  is_active BOOLEAN NOT NULL DEFAULT FALSE,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);
CREATE TABLE products(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,
  category_id INT NOT NULL,
  CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES categories(id)
);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE products;
DROP TABLE categories;
DROP TYPE gender;
-- +goose StatementEnd
