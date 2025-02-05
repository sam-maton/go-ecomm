package main

import (
	"net/http"
)

func (app *application) home(w http.ResponseWriter, r *http.Request) {
	app.render(w, http.StatusOK, "home.html")
}

func (app *application) mens(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("Mens Collection"))
}

func (app *application) womens(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("Womens Collection"))
}

func (app *application) packsAndGear(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("Packs & Gear Collection"))
}
