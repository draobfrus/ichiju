require 'rails_helper'

RSpec.describe "MisosoupBases", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/misosoup_bases/new"
      expect(response).to have_http_status(:success)
    end
  end

end
