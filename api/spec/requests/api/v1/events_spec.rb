require 'rails_helper'

RSpec.describe 'Events', type: :request do
  describe 'event' do
    before(:each) do
      event = create(:event)
    end

    it 'ユーザー一覧取得' do
      get '/api/v1/events/'
      json = JSON.parse(response.body)
      # responseの可否判定
      expect(response.status).to eq(200)
    end
    
  end
end