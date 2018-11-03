AMBER_ENV = ARGV[0]? || ENV["AMBER_ENV"]? || "development"

Amber::Server.configure do |app|
  # Server options
  app_path = __FILE__ # Do not change unless you understand what you are doing.
  app.name = "Triathlets web application."
  app.port = (ENV["PORT"] ||= "3000").to_i # Port you wish your app to run
  # app.env = (ENV["AMBER_ENV"] ||= "development").to_s
  # app.logger = ::Logger.new(STDOUT)
  app.logger.level = ::Logger::INFO
end
