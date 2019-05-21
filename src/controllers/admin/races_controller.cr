module Admin
  class RacesController < DashboardController
    def index
      races = Race.all.to_a
      render("index.slang")
    end

    def show
      race = Race.find! params["id"]
      respond_with do
        html render("show.slang")
        json race.to_json
      end
    end

    def create
    end

    def update
    end

    def destroy
    end
  end
end
