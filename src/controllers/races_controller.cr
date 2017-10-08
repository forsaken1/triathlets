class RacesController < ApplicationController
  def show
    race_disciplines = RaceDiscipline.where { _race_id == race.id }.ordered.includes(:discipline)
    render("show.slang")
  end

  private def race
    @race ||= Race.find!(params["id"]).as(Race)
  end

  private def results
    @results ||= if params["group_id"]?
      Result.where { _race_id == race.id && _group_id == params["group_id"] }
    else
      Result.where { _race_id == race.id }
    end.includes(:result_race_disciplines).includes(:user).as(Jennifer::QueryBuilder::ModelQuery(Result))
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
end
