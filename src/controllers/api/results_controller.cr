module Api
  class ResultsController < ApplicationController
    def index
      results = Result.all.order(Result._time.asc).includes(:city, :user, :team, :group).by_race_id race_id

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
      result = Result.build create_result_params

      respond_with do
        if result.save
          json result.as_json.to_json
        else
          json({"errors" => result.errors.to_a}.to_json)
        end
      end
    end

    def update
      result = Result.find! params["id"]

      respond_with do
        if result.update(update_result_params)
          json result.as_json.to_json
        else
          json({"errors" => result.errors.to_a}.to_json)
        end
      end
    end

    def destroy
      result = Result.find! params["id"]
      result.destroy

      halt!(200)
    end

    private def race_id
      params["race_id"]? ? params["race_id"] : nil
    end

    private def update_result_params
      {
        user_id:  params[:user_id].to_i,
        city_id:  params[:city_id].to_i,
        team_id:  params[:team_id].to_i,
        group_id: params[:group_id]? ? params[:group_id] : nil,
        time:     params[:time],
      }
    end

    private def create_result_params
      update_result_params.merge({
        race_id: params[:race_id].to_i,
      })
    end
  end
end
