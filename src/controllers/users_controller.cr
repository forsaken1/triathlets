class UsersController < ApplicationController
  def index
    users = User.search(name).to_a
    render("index.slang")
  end

  def show
    user = User.find! params["id"]
    user_presenter = UserPresenter.new user
    render("show.slang")
  end

  private def name
    params["name"]? ? params["name"] : ""
  end
end
