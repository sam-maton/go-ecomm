-- +goose Up
-- +goose StatementBegin
ALTER TABLE categories DROP COLUMN is_active;
ALTER TABLE products ADD COLUMN is_active BOOLEAN NOT NULL DEFAULT FALSE;
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
ALTER TABLE categories ADD COLUMN is_active BOOLEAN NOT NULL DEFAULT FALSE;
ALTER TABLE products DROP COLUMN is_active;
-- +goose StatementEnd
