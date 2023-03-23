require 'rails_helper'

RSpec.xdescribe "MisosoupBases", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/misosoup_bases"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/misosoup_bases/new"
      expect(response).to have_http_status(:success)
    end
  end

end
