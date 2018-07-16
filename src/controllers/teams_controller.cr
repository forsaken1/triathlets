class TeamsController < ApplicationController
  def index
    teams = Team.search(name).to_a
    render("index.slang")
  end

  def show
    team = Team.find! params["id"]
    render("show.slang")
  end

  private def name
    params["name"]? ? params["name"] : ""
  end
end
