class HomeController < ApplicationController
  def index
    races = Race.all
    render("index.slang")
  end
end

