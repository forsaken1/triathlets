module Api
  class UsersController < ApplicationController
    def index
      users = User.all

      respond_with do
        json users.to_a.map(&.as_json).to_json
      end
    end
  end
end
