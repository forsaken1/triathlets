class RacesController < ApplicationController
  def show
    best = Best.new results_table.users, results_table.results, results_table.result_race_disciplines, results_table.race_disciplines
    render("show.slang")
  end

  private def results_table
    @results_table ||= ResultsTable.new(params).as(ResultsTable)
  end

  # For tabs
  private def active?(group)
    params["group_id"]? && params["group_id"].to_i == group.id
  end

  # Sort icon html helper
  private def sort_icon(position)
    if (position.nil? && !params["position"]?) || (params["position"]? && position == params["position"].to_i)
      "<i class=\"fa fa-sort-#{results_table.order}\"></i>"
    else
      "<i class=\"fa fa-sort\"></i>"
    end
  end
end
