-- +goose Up
-- +goose StatementBegin
ALTER TABLE categories RENAME COLUMN main_category TO category;
ALTER TABLE categories RENAME COLUMN sub_category TO product_type;
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
ALTER TABLE categories RENAME COLUMN category TO main_category;
ALTER TABLE categories RENAME COLUMN product_type TO sub_category;
-- +goose StatementEnd
