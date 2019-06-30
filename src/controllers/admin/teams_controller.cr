module Admin
  class TeamsController < DashboardController
    def index
      teams = Team.all

      respond_with do
        json teams.to_a.map(&.as_json).to_json
      end
    end
  end
end
