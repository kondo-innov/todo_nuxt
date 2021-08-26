require 'rails_helper'

RSpec.describe 'users', type: :request do
  describe 'user' do
    before(:each) do
      user = create(:user)
    end

    it 'ユーザー一覧取得' do
      get '/api/v1/users/'
      json = JSON.parse(response.body)
      # responseの可否判定
      expect(response.status).to eq(200)
    end
    
  end
end