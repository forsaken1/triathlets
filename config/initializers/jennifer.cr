require "jennifer"
require "jennifer/adapter/postgres"

require "colorize"

Jennifer::Config.read("config/database.yml", :development)

Jennifer::Config.configure do |conf|
  conf.logger = Logger.new(STDOUT)

  conf.logger.formatter = Logger::Formatter.new do |severity, datetime, progname, message, io|
    io << datetime << ": " << message
  end
  conf.logger.level = Logger::DEBUG
end
