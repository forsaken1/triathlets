require "jennifer"
require "jennifer/adapter/postgres"
require "./config/jennifer"
require "./db/migrations/*"
require "sam"
require "jennifer/sam"

load_dependencies "jennifer"
Sam.help
