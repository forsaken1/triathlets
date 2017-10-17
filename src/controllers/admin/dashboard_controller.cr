module Admin
  class DashboardController < ApplicationController
    LAYOUT = "admin.slang"

    def index
      render "src/views/admin/dashboard/index.slang"
    end
  end
end
