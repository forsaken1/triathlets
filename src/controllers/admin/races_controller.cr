module Admin
  class RacesController < DashboardController
    def index
      races = Race.all
      # respond_with { json races }
      races.to_json
    end

    def show
      race = Race.find params["id"]
      # respond_with { json race.to_json }
      race.to_json
    end

    def create
    end

    def update
    end

    def destroy
    end
  end
end
