class Best
  @users : Hash(Int32, User)
  @results : Array(Result)
  @race_disciplines : Array(RaceDiscipline)
  @result_race_disciplines : Array(ResultRaceDiscipline)

  @swimmer_result : ResultRaceDiscipline | Nil
  @bicyclist_result : ResultRaceDiscipline | Nil
  @runner_result : ResultRaceDiscipline | Nil
  @transit_results : Array(Time | User) | Nil

  @swim_race_disciplines : Array(RaceDiscipline)
  @bicycle_race_disciplines : Array(RaceDiscipline)
  @run_race_disciplines : Array(RaceDiscipline)
  @transit_race_disciplines : Array(RaceDiscipline)

  def initialize(@users, @results, @result_race_disciplines, @race_disciplines)
    @swim_race_disciplines = discipline_by_name "swim"
    @bicycle_race_disciplines = discipline_by_name "bicycle"
    @run_race_disciplines = discipline_by_name "run"
    @transit_race_disciplines = discipline_by_name "transit"

    @swimmer_result = result_race_discipline_by_race_discipline @swim_race_disciplines if @swim_race_disciplines.any?
    @bicyclist_result = result_race_discipline_by_race_discipline @bicycle_race_disciplines if @bicycle_race_disciplines.any?
    @runner_result = result_race_discipline_by_race_discipline @run_race_disciplines if @run_race_disciplines.any?
    @transit_results = result_race_discipline_by_transit @transit_race_disciplines if @transit_race_disciplines.any?
  end

  def swim?
    @swimmer_result
  end

  def bicycle?
    @bicyclist_result
  end

  def run?
    @runner_result
  end

  def transit?
    @transit_results
  end

  # N + 1!
  def swimmer
    swimmer_result.result!.user!
  end

  def swimmer_time
    swimmer_result.time
  end

  def swimmer_speed
    swimmer_result.speed @swim_race_disciplines.first
  end

  def bicyclist
    bicyclist_result.result!.user!
  end

  def bicyclist_time
    bicyclist_result.time
  end

  def bicyclist_speed
    bicyclist_result.speed @bicycle_race_disciplines.first
  end

  def runner
    runner_result.result!.user!
  end

  def runner_time
    runner_result.time
  end

  def runner_speed
    runner_result.speed @run_race_disciplines.first
  end

  def transit_name
    transit_results[1].as(User).name
  end

  def transit_time
    transit_results[0].as(Time).to_s "%X"
  end

  private def swimmer_result
    @swimmer_result.as(ResultRaceDiscipline)
  end

  private def bicyclist_result
    @bicyclist_result.as(ResultRaceDiscipline)
  end

  private def runner_result
    @runner_result.as(ResultRaceDiscipline)
  end

  private def transit_results
    @transit_results.as(Array(Time | User))
  end

  private def discipline_by_name(name)
    @race_disciplines
      .select { |e| e.discipline!.name == name }
      .as(Array(RaceDiscipline))
  end

  private def result_race_discipline_by_race_discipline(race_disciplines)
    result_race_disciplines = @result_race_disciplines
                                .select { |e| race_disciplines.map(&.id).includes?(e.race_discipline_id) && e.time }
                                .sort { |x, y| x <=> y }

    result_race_disciplines.last.as(ResultRaceDiscipline) if result_race_disciplines.any?
  end

  private def result_race_discipline_by_transit(transit_race_disciplines)
    result_race_disciplines = @result_race_disciplines
                                .select { |e| transit_race_disciplines.map(&.id).includes?(e.race_discipline_id) }
                                .group_by { |e| e.result_id }
                                .map do |result_id, result_race_disciplines|
                                  if result_race_disciplines.all? { |e| e.time }
                                    [
                                      result_race_disciplines.reduce(Time.parse("0:0:0", "%X", Time::Location::UTC)) { |acc, e| acc + Time.parse(e.time.as(String), "%X", Time::Location::UTC) },
                                      @users[@results.find { |e| e.id == result_id }.as(Result).user_id],
                                    ]
                                  end
                                end
                                .compact
                                .sort { |x, y| x[0].as(Time) <=> y[0].as(Time) }

    result_race_disciplines.first.as(Array(Time | User)) if result_race_disciplines.any?
  end
end
