module Api
  module V1
    class CurrentUsersController < ApplicationController
      def show
        render json: { url: current_user.image.service_url, messages: '成功' }, stauts: :ok
      end 
    end
  end
end