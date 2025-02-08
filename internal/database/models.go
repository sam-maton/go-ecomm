// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.28.0

package database

import (
	"database/sql"
	"database/sql/driver"
	"fmt"
	"time"
)

type Gender string

const (
	GenderMen    Gender = "men"
	GenderWomen  Gender = "women"
	GenderUnisex Gender = "unisex"
)

func (e *Gender) Scan(src interface{}) error {
	switch s := src.(type) {
	case []byte:
		*e = Gender(s)
	case string:
		*e = Gender(s)
	default:
		return fmt.Errorf("unsupported scan type for Gender: %T", src)
	}
	return nil
}

type NullGender struct {
	Gender Gender
	Valid  bool // Valid is true if Gender is not NULL
}

// Scan implements the Scanner interface.
func (ns *NullGender) Scan(value interface{}) error {
	if value == nil {
		ns.Gender, ns.Valid = "", false
		return nil
	}
	ns.Valid = true
	return ns.Gender.Scan(value)
}

// Value implements the driver Valuer interface.
func (ns NullGender) Value() (driver.Value, error) {
	if !ns.Valid {
		return nil, nil
	}
	return string(ns.Gender), nil
}

type Category struct {
	ID          int32
	Gender      Gender
	Category    string
	ProductType string
	CreatedAt   time.Time
	UpdatedAt   time.Time
}

type Inventory struct {
	ID               int32
	ProductVariantID int32
	Quantity         int32
	Size             string
	CreatedAt        time.Time
	UpdatedAt        time.Time
}

type Product struct {
	ID          int32
	Name        string
	Description string
	CreatedAt   time.Time
	UpdatedAt   time.Time
	CategoryID  int32
	Price       sql.NullInt32
	IsActive    bool
}

type ProductVariant struct {
	ID            int32
	ProductID     int32
	Color         string
	PriceOverride sql.NullInt32
	Discount      sql.NullInt32
	CreatedAt     time.Time
	UpdatedAt     time.Time
}
