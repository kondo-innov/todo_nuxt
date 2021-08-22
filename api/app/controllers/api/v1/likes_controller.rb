module Api
  module V1
    class LikesController < ApplicationController
      def index
        likes = current_user.likes
        render json: likes, status: :ok
      end

      def create
        @like = Like.new(like_params)
        @like.user_id = current_user.id
        if @like.save
          render json: @like, status: :ok
        else
          render json: { message: 'いいねに失敗しました' }, status: 400
        end
      end

      def destroy
        @like = Like.find_by(tweet_id: params[:id])
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
