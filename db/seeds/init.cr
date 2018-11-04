require "jennifer"
require "jennifer/adapter/postgres"
require "../../config/initializers/jennifer"
require "../../src/models/*"

require "./lib"

delete_all_info

require "./constants"
require "./races/*"
