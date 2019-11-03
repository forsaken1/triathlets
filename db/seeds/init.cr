require "jennifer"
require "jennifer/adapter/postgres"
require "../../config/initializers/jennifer"
require "../../src/models/*"

require "./lib/*"

Import.delete_all_info

require "./constants"
require "./races/*"
