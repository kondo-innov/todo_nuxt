module Api
  module V1
    class JoinsController < ApplicationController
      def index

      end
      def create
        @join = Join.new(join_params)
        @join.user_id = current_user.id
        if @join.save
          render json: @join, status: :ok
        else
          render json: {message: '参加に失敗しました' }, status: 400
        end
      end

      def destroy
        @join = Join.find_by(join_id: params[:id])
        @join.destroy
        render status: 200, json: false
      end
      
      private
        def join_params
          params.permit(:user_id, :event_id)
        end
    end
  end
end