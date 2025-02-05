package main

import (
	"fmt"
	"html/template"
	"net/http"
)

func (app *application) home(w http.ResponseWriter, r *http.Request) {
	t, err := template.New("home").ParseFiles("ui/html/base.html", "ui/html/partials/nav.html", "ui/html/pages/home.html")
	if err != nil {
		fmt.Println(err)
		http.Error(w, http.StatusText(http.StatusInternalServerError), http.StatusInternalServerError)
		return
	}
	t.ExecuteTemplate(w, "base", nil)
}
