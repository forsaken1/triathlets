class RacesController < ApplicationController
  def show
    race = Race.find! params["id"]
    race_disciplines = RaceDiscipline.where { _race_id == race.id }.includes(:discipline)
    results = Result.where { _race_id == race.id }.includes(:result_race_disciplines).includes(:user)
    render("show.slang")
  end
end
