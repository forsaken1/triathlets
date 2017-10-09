class HomeController < ApplicationController
  def index
    races = Race.search_by_sql "SELECT * FROM races ORDER BY TO_TIMESTAMP(races.date, 'DD.MM.YYYY') DESC"
    render("index.slang")
  end

  def about
    render("about.slang")
  end
end

