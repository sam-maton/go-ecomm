-- name: GetProductVariantsFromCategory :many
SELECT * 
FROM categories 
WHERE 
  ($1 IS NULL OR category = $1) AND 
  ($2 IS NULL OR product_type = $2) AND 
  ($3 IS NULL OR gender = $3);

SELECT products.name, product_variants.color FROM categories
INNER JOIN products ON categories.id = products.category_id
INNER JOIN product_variants ON products.id = product_variants.product_id
WHERE categories.category = 'jackets';