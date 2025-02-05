package main

import (
	"net/http"

	"github.com/sam-maton/go-ecomm/ui"
)

func (app *application) routes() http.Handler {
	mux := http.NewServeMux()

	fileServer := http.FileServer(http.FS(ui.Files))
	mux.Handle("GET /static/", fileServer)

	mux.HandleFunc("/", app.home)
	mux.HandleFunc("GET /collections/men", app.mens)
	mux.HandleFunc("GET /collections/women", app.womens)
	mux.HandleFunc("GET /collections/packs-gear", app.packsAndGear)
	return mux
}
