require 'rails_helper'

RSpec.xdescribe "Profiles", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/profile"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/profile/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
