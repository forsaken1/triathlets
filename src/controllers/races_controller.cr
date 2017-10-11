class RacesController < ApplicationController
  def show
    race_disciplines = RaceDiscipline.where { _race_id == race.id }.ordered.includes(:discipline)
    render("show.slang")
  end

  private def race
    @race ||= Race.find!(params["id"]).as(Race)
  end

  private def order
    if params["order"]? && params["order"] == "desc"
      "desc"
    else
      "asc"
    end
  end

  private def group_id_sql
    if params["group_id"]?
      "AND results.group_id = #{params["group_id"].to_i}"
    else
      ""
    end
  end

  private def results
    @results ||= if params["position"]?
      Result.search_by_sql(
        "SELECT results.* FROM results
        LEFT JOIN result_race_disciplines ON result_race_disciplines.result_id = results.id
        AND result_race_disciplines.position = #{params["position"].to_i}
        WHERE results.race_id = $1
        #{group_id_sql}
        ORDER BY TO_TIMESTAMP(result_race_disciplines.time, 'HH24.MI.SS') #{order}",
        [race.id]
      )
    else
      Result.search_by_sql(
        "SELECT results.* FROM results
        WHERE results.race_id = $1
        #{group_id_sql}
        ORDER BY TO_TIMESTAMP(results.time, 'HH.MI.SS') #{order}",
        [race.id]
      )
    end.as(Array(Result))#.includes(:result_race_disciplines).includes(:user).as(Jennifer::QueryBuilder::ModelQuery(Result))
  end

  private def all_results
    @all_results ||= Result.where { _race_id == race.id }.as(Jennifer::QueryBuilder::ModelQuery(Result))
  end

  private def groups
    @groups ||= all_results.to_a.map do |result|
      result.group
    end.compact.uniq do |group|
      group.id
    end.as(Array(Group))
  end

  private def active?(group)
    params["group_id"]? && params["group_id"].to_i == group.id
  end

  private def race_path(race, **attributes)
    joined_attrs = unless attributes.empty?
              "?" + attributes.map do |key, value|
                      "#{key}=#{value}" unless value.nil? || value.blank?
                    end.compact.join("&")
            else
              ""
            end
    "/races/#{race.id}#{joined_attrs}"
  end
end
