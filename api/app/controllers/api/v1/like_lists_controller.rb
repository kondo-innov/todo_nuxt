module Api
  module V1
    class LikeListsController < ApplicationController
      def index
        @user = User.find(params[:user_id])
        @tweets = Tweet.joins(:likes).where(likes: { user: @user })
      end
    end
  end
end
