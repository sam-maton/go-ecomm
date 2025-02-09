-- name: GetProductVariants :many
SELECT products.name, product_variants.color
FROM categories
INNER JOIN products ON categories.id = products.category_id
INNER JOIN product_variants ON products.id = product_variants.product_id
WHERE 
  (category = $1 OR $1::text IS NULL) AND 
  (product_type = $2 OR $2::text IS NULL) AND 
  (gender = $3 OR $3::text IS NULL);