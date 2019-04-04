class ResultsTable
  # @race_disciplines : Array(RaceDiscipline)
  # @race_disciplines_hash : Hash(Int32, RaceDiscipline)

  def initialize(@params : Amber::Validators::Params)
    includes results
  end

  def race_disciplines
    @race_disciplines ||= RaceDiscipline.all.by_race_id(race.id).ordered.includes(:discipline).to_a.as(Array(RaceDiscipline))
  end

  def race_disciplines_hash
    @race_disciplines_hash ||= race_disciplines.map { |o| {o.id!, o} }.to_h.as(Hash(Int32, RaceDiscipline))
  end

  # Filter results for current race
  def results
    @results ||= if @params["position"]?
                   Result.all.find_by_sql(
                     "SELECT results.* FROM results
                      LEFT JOIN result_race_disciplines ON result_race_disciplines.result_id = results.id
                      AND result_race_disciplines.position = $1
                      WHERE results.race_id = $2
                      #{group_id_sql}
                      ORDER BY TO_TIMESTAMP(result_race_disciplines.time, 'HH24.MI.SS') #{order}",
                     [@params["position"].to_i, race.id!]
                   )
                 else
                   Result.all.find_by_sql(
                     "SELECT results.* FROM results
                      WHERE results.race_id = $1
                      #{group_id_sql}
                      ORDER BY TO_TIMESTAMP(results.time, 'HH24.MI.SS') #{order}",
                     [race.id!]
                   )
                 end.as(Array(Result))
  end

  private def includes(collection)
    result_ids, user_ids, team_ids, city_ids = [] of Int32, [] of Int32, [] of Int32, [] of Int32
    collection.each do |item|
      user_ids << item.user_id
      team_ids << item.team_id
      city_ids << item.city_id
      result_ids << item.id.as(Int32)
    end
    @users = User.all.find_by_sql("SELECT * FROM users WHERE id IN (#{user_ids.uniq.join(",")})").map { |o| {o.id.as(Int32), o.as(User)} }.to_h.as(Hash(Int32, User))
    @teams = Team.all.find_by_sql("SELECT * FROM teams WHERE id IN (#{team_ids.uniq.join(",")})").map { |o| {o.id.as(Int32), o.as(Team)} }.to_h.as(Hash(Int32, Team))
    @cities = City.all.find_by_sql("SELECT * FROM cities WHERE id IN (#{city_ids.uniq.join(",")})").map { |o| {o.id.as(Int32), o.as(City)} }.to_h.as(Hash(Int32, City))
    @result_race_disciplines = ResultRaceDiscipline.all.find_by_sql("SELECT * FROM result_race_disciplines WHERE result_id IN (#{result_ids.uniq.join(",")})").as(Array(ResultRaceDiscipline))
  end

  # Current race
  def race
    @race ||= Race.find!(@params["id"]).as(Race)
  end

  def result_race_disciplines
    @result_race_disciplines.as(Array(ResultRaceDiscipline))
  end

  def users
    @users.as(Hash(Int32, User))
  end

  def teams
    @teams.as(Hash(Int32, Team))
  end

  def cities
    @cities.as(Hash(Int32, City))
  end

  # Safe current order
  def order
    if @params["order"]? && @params["order"] == "desc"
      "desc"
    else
      "asc"
    end
  end

  # All results for current race
  private def all_results
    @all_results ||= Result.where { _race_id == race.id }.as(Jennifer::QueryBuilder::ModelQuery(Result))
  end

  private def group_ids
    all_results.to_a.map do |result|
      result.group_id
    end.compact.uniq do |group_id|
      group_id
    end
  end

  # Groups list from all results for race
  def groups
    # where in jennifer!
    @groups ||= if group_ids.any?
                  Group.all.find_by_sql("SELECT * FROM groups WHERE id IN (#{group_ids.join(",")})").as(Array(Group))
                else
                  [] of Group
                end
  end

  # Safe SQL for sorting by groups
  private def group_id_sql
    if @params["group_id"]?
      "AND results.group_id = #{@params["group_id"].to_i}"
    else
      ""
    end
  end
end
