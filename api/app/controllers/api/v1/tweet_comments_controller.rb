module Api
  module V1
    class TweetCommentsController < ApplicationController
      def create
        @tweetcomment = TweetComment.new(tweet_params)
        @tweetcomment.user_id = current_user.id
        if @tweetcomment.save
          render json: @tweetcomment, status: :ok
        else
          render json: { message: 'コメントに失敗しました' }, status: 400
        end
      end

      def destroy
        @comment = TweetComment.find(params[:id])
        @comment.destroy
        render status: 200, json: false
      end

      private

      def tweet_params
        params.permit(:user_id, :tweet_id, :content)
      end
    end
  end
end
