module Admin
  class ResultsController < DashboardController
    def index
      results = Result.all.by_race_id race_id

      respond_with do
        json results.to_a.map(&.as_json).to_json
      end
    end

    def show
      result = Result.find! params["id"]

      respond_with do
        json result.as_json.to_json
      end
    end

    def create
    end

    def update
    end

    def destroy
    end

    private def race_id
      params["race_id"]? ? params["race_id"] : nil
    end
  end
end
