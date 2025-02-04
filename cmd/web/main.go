package main

import (
	"flag"
	"log/slog"
	"net/http"
	"os"
)

type application struct {
	logger *slog.Logger
}

func main() {
	addr := flag.String("addr", ":4321", "HTTP network address")

	flag.Parse()

	logger := slog.New(slog.NewTextHandler(os.Stdout, &slog.HandlerOptions{
		AddSource: false,
	}))

	app := application{
		logger: logger,
	}

	server := http.Server{
		Addr:     *addr,
		ErrorLog: slog.NewLogLogger(logger.Handler(), slog.LevelError),
		Handler:  app.routes(),
	}

	logger.Info("starting server on http://localhost" + *addr)

	err := server.ListenAndServe()
	logger.Error(err.Error())
	os.Exit(1)
}
