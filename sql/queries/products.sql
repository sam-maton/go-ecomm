-- name: GetProductVariants :many
SELECT products.name, product_variants.color
FROM categories
INNER JOIN products ON categories.id = products.category_id
INNER JOIN product_variants ON products.id = product_variants.product_id
WHERE 
  (category = @category OR NOT @use_category::bool  ) AND 
  (product_type = @product_type OR NOT @use_product_type::bool)  AND 
  (gender = @gender OR NOT @use_gender::bool);