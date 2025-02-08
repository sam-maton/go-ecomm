package main

import (
	"fmt"
	"net/http"
)

func (app *application) home(w http.ResponseWriter, r *http.Request) {
	app.render(w, r, http.StatusOK, "home.html")
}

func (app *application) mens(w http.ResponseWriter, r *http.Request) {
	categories, err := app.db.GetCategories(r.Context())
	if err != nil {
		app.serverError(w, r, err)
	}
	for _, c := range categories {
		fmt.Println(c.Category)
	}
	app.render(w, r, http.StatusOK, "mens.html")
}

func (app *application) womens(w http.ResponseWriter, r *http.Request) {
	app.render(w, r, http.StatusOK, "womens.html")
}

func (app *application) packsAndGear(w http.ResponseWriter, r *http.Request) {
	app.render(w, r, http.StatusOK, "packs-gear.html")
}
