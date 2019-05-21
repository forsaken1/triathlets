Amber::Server.configure do |app|
  pipeline :web do
    # Plug is the method to use connect a pipe (middleware)
    # A plug accepts an instance of HTTP::Handler
    plug Amber::Pipe::PoweredByAmber.new
    # Plug is the method to use connect a pipe (middleware)
    # A plug accepts an instance of HTTP::Handler
    plug Amber::Pipe::Error.new
    plug Amber::Pipe::Logger.new
    plug Amber::Pipe::Session.new
    # plug Amber::Pipe::Flash.new
    plug Amber::Pipe::CSRF.new
  end

  # All static content will run these transformations
  pipeline :static do
    plug Amber::Pipe::PoweredByAmber.new
    plug Amber::Pipe::Error.new
    plug Amber::Pipe::Static.new("./public")
  end

  routes :web do
    get "/", HomeController, :index
    get "/about", HomeController, :about
    get "/races/:id", RacesController, :show
    get "/users", UsersController, :index
    get "/users/:id", UsersController, :show
    get "/teams", TeamsController, :index
    get "/teams/:id", TeamsController, :show
  end

  routes :web, "/admin" do
    get "/", Admin::DashboardController, :index
    resources "/races", Admin::RacesController, only: [:index, :show, :create, :update, :destroy]
    resources "/results", Admin::ResultsController, only: [:index, :show, :create, :update, :destroy]
    resources "/resources", Admin::ResourcesController, only: [:index, :show, :create, :update, :destroy]
  end

  routes :static do
    # Each route is defined as follow
    # verb resource : String, controller : Symbol, action : Symbol
    get "/*", Amber::Controller::Static, :index
  end
end
