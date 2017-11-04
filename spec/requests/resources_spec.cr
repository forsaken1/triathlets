require "../spec_helper"

describe "Admin::Resources" do
  describe "GET /admin/resources" do
    it "responds successfully" do
      get "/admin/resources"
      response.status_code.should eq 200
    end
  end

  describe "GET /admin/resources/:id" do
    it "responds successfully" do
      resource = User.create name: "test user"
      get "/admin/resources/#{resource.id}"
      response.status_code.should eq 200
    end
  end

  describe "POST /admin/resources" do
    it "responds successfully" do
      post "/admin/resources"
      response.status_code.should eq 200
    end
  end

  describe "PUT /admin/resources/:id" do
    it "responds successfully" do
      resource = User.create name: "test user"
      put "/admin/resources/#{resource.id}"
      response.status_code.should eq 200
    end
  end

  describe "DELETE /admin/resources/:id" do
    it "responds successfully" do
      resource = User.create name: "test user"
      delete "/admin/resources/#{resource.id}"
      response.status_code.should eq 200
    end
  end
end
