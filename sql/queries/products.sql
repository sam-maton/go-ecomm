-- name: GetProductVariants :many
SELECT categories.gender, categories.category, categories.product_type, products.id AS product_id, products.name, products.description, products.price, product_variants.id AS variant_id, product_variants.color, product_variants.price_override
FROM categories
INNER JOIN products ON categories.id = products.category_id
INNER JOIN product_variants ON products.id = product_variants.product_id
WHERE 
  (category = @category OR NOT @use_category::bool  ) AND 
  (product_type = @product_type OR NOT @use_product_type::bool)  AND 
  (gender = @gender OR NOT @use_gender::bool);