module Admin
  class ResourcesController < DashboardController
    def index
      # response.puts collection_response
    end

    def show
    end

    def create
    end

    def update
    end

    def destroy
    end

    private def collection_response
      tuple = {collection: collection.to_a}.to_json
    end

    private def collection
      resource_class.all
    end

    private def resource_class
      User
    end
  end
end
