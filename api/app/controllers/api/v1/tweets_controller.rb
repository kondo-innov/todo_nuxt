module Api
  module V1
    class TweetsController < ApplicationController
      def index
        @tweets = Tweet.all.page(params[:page]).order(created_at: 'DESC')
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

      def show

      end

      def destroy
      end

      private
        def tweet_params
          params.permit(:picture, :description)
        end
    end
  end
end