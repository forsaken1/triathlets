class RacesPresenter
  @results : Array(Result)

  def initialize(@races : Array(Race), @user : User)
    @results = Result.all.where { _user_id == @user.id & _race_id.in(@races.map(&.id)) }.to_a
  end

  def each_with_index(&callback : RacePresenter, Int32 -> String::Builder)
    @races.each_with_index do |race, i|
      yield RacePresenter.new(race, nil), i
    end
  end

  private def time_by_race(race : Race)
    @results.find { |result| result.race_id == race.id }.as(Result).time_format
  end
end
