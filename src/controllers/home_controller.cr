class HomeController < ApplicationController
  def index
    races = Race.all.ordered_by_date
    render("index.slang")
  end

  def about
    render("about.slang")
  end
end
