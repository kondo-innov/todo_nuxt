module Api
  module V1
    class LikesController < ApplicationController
      def create
        @like = Like.new(like_params)
        if @like.save
          render json: @like, status: :ok
        else
          render json: { status: 400}
        end
      end

      def destroy
        @like = Like.find_by(user_id: params[:user_id], tweet_id: params[:tweet_id])
        @like.destroy
        render status: 200, json: false
      end
      
      private
        def like_params
          params.permit(:user_id, :tweet_id)
        end
    end
  end
end