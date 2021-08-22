module Api
  module V1
    class UsersController < ApplicationController
      def index
        users = current_user
        render json: users
      end

      def create
        @user = User.find(current_user.id)
        render json: { url: current_user.image.service_url, messages: '成功' }, stauts: :ok if @user.update(controller_params)
      end

      def show; end

      def delete; end

      private

      def name
        File.basename(filename, '.*')
      end

      def filename
        params[:filename]
      end

      def controller_params
        # imageはファイルではなくblob.signed_idが送られてきます
        params.permit(:image)
      end
    end
  end
end
