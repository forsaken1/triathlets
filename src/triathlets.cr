require "jennifer"
require "jennifer/adapter/postgres"

require "amber"
require "../config/*"
require "./models/**"
require "./helpers/**"
require "./mailers/**"
require "./controllers/application_controller"
require "./controllers/**"

Amber::Server.instance.run
