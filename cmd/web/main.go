package main

import (
	"database/sql"
	"flag"
	"html/template"
	"log/slog"
	"net/http"
	"os"

	_ "github.com/lib/pq"
	"github.com/sam-maton/go-ecomm/internal/database"
)

type application struct {
	logger        *slog.Logger
	templateCache map[string]*template.Template
	db            *database.Queries
}

func main() {
	addr := flag.String("addr", ":4321", "HTTP network address")
	dsn := flag.String("dsn", "postgres://Sam.Maton:@localhost:5432/ecomm?sslmode=disable", "Postgres connection string")

	flag.Parse()

	//SETUP LOGGER
	logger := slog.New(slog.NewTextHandler(os.Stdout, &slog.HandlerOptions{
		AddSource: false,
	}))

	//SETUP TEMPLATE CACHE
	cache, err := newTemplateCache()
	if err != nil {
		logger.Error(err.Error())
		os.Exit(1)
	}

	//SETUP DB
	db, err := openDB(*dsn)
	if err != nil {
		logger.Error(err.Error())
		os.Exit(1)
	}
	dbQueries := database.New(db)
	defer db.Close()

	app := application{
		logger:        logger,
		templateCache: cache,
		db:            dbQueries,
	}

	server := http.Server{
		Addr:     *addr,
		ErrorLog: slog.NewLogLogger(logger.Handler(), slog.LevelError),
		Handler:  app.routes(),
	}

	logger.Info("starting server on http://localhost" + *addr)

	err = server.ListenAndServe()
	logger.Error(err.Error())
	os.Exit(1)
}

func openDB(dsn string) (*sql.DB, error) {
	db, err := sql.Open("postgres", dsn)
	if err != nil {
		return nil, err
	}

	err = db.Ping()
	if err != nil {
		db.Close()
		return nil, err
	}

	return db, nil
}
