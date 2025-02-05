-- +goose Up
-- +goose StatementBegin
CREATE TYPE gender AS ENUM ("men", "women", "unisex");
CREATE TABLE products(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  gender gender NOT NULL,
  description TEXT NOT NULL,
)
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE products;
-- +goose StatementEnd
