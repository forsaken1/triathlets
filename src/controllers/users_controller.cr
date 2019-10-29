class UsersController < ApplicationController
  def index
    users = User.search(name).to_a
    render("index.slang")
  end

  def show
    user = User.find! params["id"]
    races = Race.by_user_id(user.id, order_query).to_a
    user_presenter = UserPresenter.new user
    races_presenter = RacesPresenter.new races, user
    render("show.slang")
  end

  private def name
    params["name"]? ? params["name"] : ""
  end

  private def order_query
    "ORDER BY TO_TIMESTAMP(races.date, 'DD.MM.YYYY')"
  end
end
