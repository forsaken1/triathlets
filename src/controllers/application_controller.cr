class ApplicationController < Amber::Controller::Base
  include RouteHelpers

  LAYOUT = "application.slang"

  before_action do
    all { @main_menu = MainMenu.new }
  end
end
