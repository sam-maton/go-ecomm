package main

import (
	"html/template"
	"net/http"
)

func (app *application) home(w http.ResponseWriter, r *http.Request) {
	t, _ := template.New("home").ParseFiles("ui/html/base.html", "ui/html/pages/home.html")
	t.ExecuteTemplate(w, "base", nil)
}
