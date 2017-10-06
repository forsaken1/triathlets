class HomeController < ApplicationController
  def index
    races = Race.ordered
    render("index.slang")
  end
end

