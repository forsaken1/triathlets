require "../spec_helper"

describe "Admin::Dashboard" do
  it "renders /admin" do
    get "/admin"
    response.status_code.should eq 200
  end
end
