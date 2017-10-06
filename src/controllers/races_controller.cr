class RacesController < ApplicationController
  def show
    race = Race.find! params["id"]
    race_disciplines = RaceDiscipline.where { _race_id == race.id }.ordered.includes(:discipline)
    results = if params["group_id"]?
                Result.where { _race_id == race.id && _group_id == params["group_id"] }
              else
                Result.where { _race_id == race.id }
              end
    results.includes(:result_race_disciplines).includes(:user)
    groups = [
      { :name => "Мужчины МТБ" },
      { :name => "Мужчины Шоссе" }
    ]
    render("show.slang")
  end
end
