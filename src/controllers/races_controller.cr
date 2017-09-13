class RacesController < ApplicationController
  def show
    race = Race.find! params["id"]
    race_disciplines = RaceDiscipline.where { _race_id == race.id }.includes(:discipline)
    results = Result.where { _race_id == race.id }.includes(:result_race_disciplines).includes(:user)
    render("show.slang")
  end

  def two_digits(digit : Int32)
    digit < 10 ? "0#{digit}" : digit
  end

  def all_time(results)
    seconds = results.map { |res| Time.parse(res.time, "%X").ticks / 10_000_000 }.sum(0)
    "#{two_digits hour = seconds / 3600}:#{two_digits (seconds - hour * 3600) / 60}:#{two_digits seconds % 60}"
  end
end
