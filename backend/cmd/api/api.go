package api

import (
	"backend/service/user"
	"database/sql"
	"github.com/gorilla/mux"
	"log"
	"net/http"
)

// Struct APIServer
type APIServer struct {
	addr string
	db   *sql.DB
}

func NewAPIServer(addr string, db *sql.DB) *APIServer {
	return &APIServer{
		addr: addr,
		db:   db,
	}
}

func (s *APIServer) Run() error {
	router := mux.NewRouter() // the router gets the requests from the http server and maps them to the functions
	subrouter := router.PathPrefix("/api/v1").Subrouter()

	userStore := user.NewStore(s.db)
	userHandler := user.NewHandler(userStore)
	userHandler.RegisterRoutes(subrouter)

	log.Println("Listening on", s.addr)

	return http.ListenAndServe(s.addr, router) // starts the http server to on the addr which is defined in the constructor and connects it to the router
}
