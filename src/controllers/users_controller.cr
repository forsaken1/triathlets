class UsersController < ApplicationController
  ORDER_QUERY = "ORDER BY TO_TIMESTAMP(races.date, 'DD.MM.YYYY')"

  def index
    users = User.search(name).to_a
    users_presenter = UsersPresenter.new users
    render("index.slang")
  end

  def show
    user = get_user
    races = get_races(user)
    user_presenter = UserPresenter.new user
    races_presenter = RacesPresenter.new races, user
    render("show.slang")
  end

  private def name
    params["name"]? ? params["name"] : ""
  end

  private def get_user
    User.find! params["id"]
  end

  private def get_races(user)
    Race.by_user_id(user.id, ORDER_QUERY).to_a
  end
end
