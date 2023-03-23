require 'rails_helper'

RSpec.xdescribe "UserSessions", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/login"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/login"
      expect(response).to have_http_status(:success)
    end
  end

end
