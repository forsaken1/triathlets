class ApplicationController < Amber::Controller::Base
  LAYOUT = "application.slang"

  # Amber, where route helpers?
  def user_path(user)
    "/users/#{user.id}"
  end

  def users_path
    "/users"
  end

  def race_path(race, **attributes)
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
