module Admin
  class CitiesController < DashboardController
    def index
      cities = City.all

      respond_with do
        json cities.to_a.map(&.as_json).to_json
      end
    end
  end
end
