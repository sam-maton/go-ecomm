-- +goose Up
-- +goose StatementBegin
CREATE TABLE product_variants (
  id SERIAL PRIMARY KEY,
  product_id INT NOT NULL,
  color VARCHAR(255) NOT NULL,
  price_override INT,
  discount INT,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,
  CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES products(id)
);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE product_variants;
-- +goose StatementEnd
