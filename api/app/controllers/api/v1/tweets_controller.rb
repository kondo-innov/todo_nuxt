module Api
  module V1
    class TweetsController < ApplicationController      
      def index
        @tweets = Tweet.all.includes({user: {image_attachment: :blob}}, 
                                            :tweet_comments, 
                                            :likes,
                                            {picture_attachment: :blob}).page(params[:page]).order(created_at: 'DESC')
      end

      def create
        @tweet = Tweet.new(tweet_params)
        @tweet.user_id = current_user.id
        if @tweet.save
          render json: @tweet, status: :created
        else
          render json: {message: '失敗しました' }, status: 400 
        end
      end

      def destroy
        tweet = Tweet.find(params[:id])
        if tweet.destroy
          render json: tweet, status: 200
        else
          render json: {message: '削除に失敗しました' }, status: 400
        end
      end

      private
        def tweet_params
          params.permit(:picture, :description)
        end
    end
  end
end