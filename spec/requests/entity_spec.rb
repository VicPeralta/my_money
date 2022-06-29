require 'rails_helper'

RSpec.describe 'Entities', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/entity/index'
      # Expected to be found but inaccesible due to authorization
      expect(response).to have_http_status(:found)
    end
  end
end
