-- +goose Up
-- +goose StatementBegin
CREATE TABLE inventories(
  id SERIAL PRIMARY KEY,
  product_variant_id INT NOT NULL,
  quantity INT NOT NULL,
  size VARCHAR(255) NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,
  CONSTRAINT fk_product_variant FOREIGN KEY (product_variant_id) REFERENCES product_variants(id)
)
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE inventories;
-- +goose StatementEnd
