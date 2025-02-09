// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.28.0
// source: products.sql

package database

import (
	"context"
)

const getProductVariants = `-- name: GetProductVariants :many
SELECT products.name, product_variants.color
FROM categories
INNER JOIN products ON categories.id = products.category_id
INNER JOIN product_variants ON products.id = product_variants.product_id
WHERE 
  (category = $1 OR NOT $2::bool  ) AND 
  (product_type = $3 OR NOT $4::bool)  AND 
  (gender = $5 OR NOT $6::bool)
`

type GetProductVariantsParams struct {
	Category       string
	UseCategory    bool
	ProductType    string
	UseProductType bool
	Gender         Gender
	UseGender      bool
}

type GetProductVariantsRow struct {
	Name  string
	Color string
}

func (q *Queries) GetProductVariants(ctx context.Context, arg GetProductVariantsParams) ([]GetProductVariantsRow, error) {
	rows, err := q.db.QueryContext(ctx, getProductVariants,
		arg.Category,
		arg.UseCategory,
		arg.ProductType,
		arg.UseProductType,
		arg.Gender,
		arg.UseGender,
	)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	var items []GetProductVariantsRow
	for rows.Next() {
		var i GetProductVariantsRow
		if err := rows.Scan(&i.Name, &i.Color); err != nil {
			return nil, err
		}
		items = append(items, i)
	}
	if err := rows.Close(); err != nil {
		return nil, err
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return items, nil
}
