class TeamsController < ApplicationController
  def index
    teams = Team.search(name).to_a
    render("index.slang")
  end

  def show
    team = Team.find! params["id"]
    users = User.by_team_id team.id
    users_presenter = UsersPresenter.new users
    render("show.slang")
  end

  private def name
    params["name"]? ? params["name"] : ""
  end
end
