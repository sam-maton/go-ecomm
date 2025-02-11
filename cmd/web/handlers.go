package main

import (
	"net/http"

	"github.com/sam-maton/go-ecomm/internal/database"
)

func (app *application) home(w http.ResponseWriter, r *http.Request) {
	app.render(w, r, http.StatusOK, "home.html", templateData{})
}

func (app *application) mens(w http.ResponseWriter, r *http.Request) {
	err := r.ParseForm()
	if err != nil {
		app.clientError(w, http.StatusBadRequest)
		return
	}

	category := r.Form.Get("category")
	productType := r.Form.Get("product_type")

	variants, err := app.db.GetProductVariants(r.Context(), database.GetProductVariantsParams{
		Category:       category,
		UseCategory:    len(category) > 0,
		ProductType:    productType,
		UseProductType: len(productType) > 0,
		Gender:         "men",
	})

	if err != nil {
		app.serverError(w, r, err)
		return
	}

	data := app.newTemplateData(r)
	data.Products = variants
	app.render(w, r, http.StatusOK, "mens.html", data)
}

func (app *application) womens(w http.ResponseWriter, r *http.Request) {
	app.render(w, r, http.StatusOK, "womens.html", templateData{})
}

func (app *application) packsAndGear(w http.ResponseWriter, r *http.Request) {
	app.render(w, r, http.StatusOK, "packs-gear.html", templateData{})
}
