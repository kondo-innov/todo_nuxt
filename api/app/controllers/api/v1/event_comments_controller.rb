module Api
  module V1
    class EventCommentsController < ApplicationController

      def create
        @eventcomment = EventComment.new(event_params)
        @eventcomment.user_id = current_user.id
        if @eventcomment.save
          render json: @eventcomment, status: :ok
        else
          render json: {message: 'コメントに失敗しました' }, status: 400
        end
      end

      def destroy
        @comment = TweetComment.find(comment_id: params[:id])
        @comment.destroy
        render status: 200, json: false
      end
      private
        def event_params
          params.permit(:user_id, :event_id, :content)
        end
    end
  end
end