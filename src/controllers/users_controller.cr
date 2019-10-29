class UsersController < ApplicationController
  def index
    users = User.search(name).to_a
    render("index.slang")
  end

  def show
    user = User.find! params["id"]
    races = Race.by_user_id(user.id).to_a
    races_presenter = RacesPresenter.new races, user
    render("show.slang")
  end

  private def name
    params["name"]? ? params["name"] : ""
  end
end
