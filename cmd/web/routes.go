package main

import (
	"net/http"
)

func (app *application) routes() http.Handler {
	mux := http.NewServeMux()

	// fileServer := http.FileServer(http.FS(ui.Files))
	// mux.Handle("GET /static/", fileServer)

	fileServer := http.FileServer(http.Dir("./ui/static"))
	mux.Handle("/static/", http.StripPrefix("/static", fileServer))

	mux.HandleFunc("/", app.home)
	mux.HandleFunc("GET /collections/mens", app.mens)
	mux.HandleFunc("GET /collections/womens", app.womens)
	mux.HandleFunc("GET /collections/packs-gear", app.packsAndGear)
	return mux
}
