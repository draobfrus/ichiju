require 'rails_helper'

RSpec.xdescribe "Calendars", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/calendar"
      expect(response).to have_http_status(:success)
    end
  end

end
