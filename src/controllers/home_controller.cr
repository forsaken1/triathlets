class HomeController < ApplicationController
  def index
    races = Race.ordered
    render("index.slang")
  end

  def about
    render("about.slang")
  end
end

