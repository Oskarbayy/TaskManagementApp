package config

import (
	"github.com/joho/godotenv"
	"os"
)

type Config struct {
	PublicHost string
	Port       string
	DBUser     string
	DBPassword string
	DBAddress  string
	DBName     string
}

var Envs = initConfig()

func initConfig() Config {
	godotenv.Load()

	return Config{
		PublicHost: getEnv("PUBLIC_HOST", "http://localhost"),
		Port:       getEnv("PORT", "3306"), // This is an error in the tutorial, I watched, it doenst use port in the mysql.Config.FormatDSN method
		DBUser:     getEnv("DB_USER", "root"),
		DBPassword: getEnv("DB_PASSWORD", ""),
		DBAddress:  getEnv("DB_ADDRESS", "localhost:3306"), // <- port is included in the addr like this -2 hours
		DBName:     getEnv("DB_NAME", "TaskManagementAppDatabase"),
	}
}

func getEnv(key, fallback string) string {
	if value, ok := os.LookupEnv(key); ok {
		return value
	}

	return fallback
}
