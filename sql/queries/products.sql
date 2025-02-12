-- name: GetProductVariants :many
SELECT c.gender, c.category, c.product_type, p.id AS product_id, p.name, p.price, pv.id AS variant_id, pv.color, pv.price_override, pi.image_url
FROM categories c
INNER JOIN products p ON c.id = p.category_id
INNER JOIN product_variants pv ON p.id = pv.product_id
INNER JOIN (SELECT DISTINCT ON (product_variant_id) product_variant_id, image_url  FROM product_images WHERE is_primary = FALSE) pi ON pv.id = pi.product_variant_id
WHERE 
  (category = @category OR NOT @use_category::bool  ) AND 
  (product_type = @product_type OR NOT @use_product_type::bool)  AND 
  (gender = @gender OR NOT @use_gender::bool)
GROUP BY p.id, c.id, pv.id, pi.image_url;
