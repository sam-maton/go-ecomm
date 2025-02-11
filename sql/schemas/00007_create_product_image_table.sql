-- +goose Up
-- +goose StatementBegin
CREATE TABLE product_images(
    id SERIAL PRIMARY KEY,
    product_variant_id INT NOT NULL,
    image_url TEXT NOT NULL,
    is_primary BOOLEAN DEFAULT FALSE,
    CONSTRAINT fk_product_variant FOREIGN KEY (product_variant_id) REFERENCES product_variants(id)
)
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE product_images;
-- +goose StatementEnd
