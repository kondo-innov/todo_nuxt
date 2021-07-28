module Api
  module V1
    class CurrentUsersController < ApplicationController
      def show
        if current_user.present? && current_user.image.attached?
          render json: { url: current_user.image.service_url, messages: '成功' }, stauts: :ok
        else 
          render json: {messages: '失敗' }, stauts: :ok 
        end
      end 
    end
  end
end