class UsersController < ApplicationController
  def index
    _users = User.search(name).to_a
    users = UserPresenter.wrap _users
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
