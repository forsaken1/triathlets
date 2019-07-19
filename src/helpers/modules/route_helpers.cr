module RouteHelpers
  # Amber, where route helpers?
  def user_path(user)
    "/users/#{user.id}"
  end

  def users_path
    "/users"
  end

  def race_path(race, **attributes)
    "/races/#{race.id}#{join_attributes(attributes)}"
  end

  def team_path(team)
    "/teams/#{team.id}"
  end

  def teams_path
    "/teams"
  end

  # admin panel routes

  def admin_race_path(race)
    "/admin/races/#{race.id}"
  end

  private def join_attributes(attributes)
    unless attributes.empty?
      "?" + attributes.map do |key, value|
        "#{key}=#{value}" unless value.nil? || value.blank?
      end.compact.join("&")
    else
      ""
    end
  end
end
