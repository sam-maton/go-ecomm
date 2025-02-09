-- name: GetCategories :many
SELECT * FROM categories WHERE category = $1 AND product_type = $2 AND gender = $3;