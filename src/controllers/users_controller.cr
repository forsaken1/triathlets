class UsersController < ApplicationController
  def index
    users = User.search(name).to_a
    render("index.slang")
  end

  def show
    user = User.find! params["id"]
    races = Race.search_by_sql "SELECT races.* FROM races JOIN results ON results.race_id = races.id WHERE results.user_id = $1 ORDER BY TO_TIMESTAMP(results.time, 'HH24.MI.SS') ASC", [user.id]
    render("show.slang")
  end

  private def name
    params["name"]? ? params["name"] : ""
  end
end
