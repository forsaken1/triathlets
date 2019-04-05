module Admin
  class DashboardController < ApplicationController
    LAYOUT = "admin.slang"

    def index
      render "admin/dashboard/index.slang"
    end
  end
end
