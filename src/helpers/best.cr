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
    @swimmer_result.as(ResultRaceDiscipline).result!.user!
  end

  def swimmer_time
    @swimmer_result.as(ResultRaceDiscipline).time
  end

  def swimmer_speed
    @swimmer_result.as(ResultRaceDiscipline).speed @swim_race_disciplines.first
  end

  def bicyclist
    @bicyclist_result.as(ResultRaceDiscipline).result!.user!
  end

  def bicyclist_time
    @bicyclist_result.as(ResultRaceDiscipline).time
  end

  def bicyclist_speed
    @bicyclist_result.as(ResultRaceDiscipline).speed @bicycle_race_disciplines.first
  end

  def runner
    @runner_result.as(ResultRaceDiscipline).result!.user!
  end

  def runner_time
    @runner_result.as(ResultRaceDiscipline).time
  end

  def runner_speed
    @runner_result.as(ResultRaceDiscipline).speed @run_race_disciplines.first
  end

  def transit_name
    @transit_results.as(Array(Time | User))[1].as(User).name
  end

  def transit_time
    @transit_results.as(Array(Time | User))[0].as(Time).to_s "%X"
  end

  private def discipline_by_name(name)
    @race_disciplines
      .select { |e| e.discipline!.name == name }
      .as(Array(RaceDiscipline))
  end

  private def result_race_discipline_by_race_discipline(race_disciplines)
    @result_race_disciplines
      .select { |e| race_disciplines.map(&.id).includes?(e.race_discipline_id) }
      .sort { |x, y| x <=> y }
      .last
      .as(ResultRaceDiscipline)
  end

  private def result_race_discipline_by_transit(transit_race_disciplines)
    @result_race_disciplines
      .select { |e| transit_race_disciplines.map(&.id).includes?(e.race_discipline_id) }
      .group_by { |e| e.result_id }
      .map do |result_id, result_race_disciplines|
        if result_race_disciplines.all? { |e| e.time }
          [
            result_race_disciplines.reduce(Time.parse("0:0:0", "%X")) { |acc, e| acc + Time.parse(e.time.as(String), "%X") },
            @users[@results.find { |e| e.id == result_id }.as(Result).user_id],
          ]
        end
      end
      .compact
      .sort { |x, y| x[0].as(Time) <=> y[0].as(Time) }
      .first
      .as(Array(Time | User))
  end
end
