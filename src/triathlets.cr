require "jennifer/adapter/postgres"
require "jennifer"

require "amber"
require "../config/*"
require "./helpers/**"
require "./models/**"
require "./mailers/**"
require "./controllers/application_controller"
require "./controllers/**"

Amber::Server.instance.run
