module Api
  class RacesController < ApplicationController
    def index
      races = Race.all.to_a
      respond_with do
        json races.to_json
      end
    end

    def show
      race = Race.find! params["id"]
      respond_with do
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
