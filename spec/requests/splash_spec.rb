require 'rails_helper'

RSpec.describe "Splashes", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/splash/show"
      expect(response).to have_http_status(:success)
    end
  end

end
