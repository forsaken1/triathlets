class HomeController < ApplicationController
  def index
    races = Race.all.order({"TO_TIMESTAMP(races.date, 'DD.MM.YYYY')" => "DESC"})
    render("index.slang")
  end

  def about
    render("about.slang")
  end
end
