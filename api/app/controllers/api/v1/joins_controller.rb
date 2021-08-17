module Api
  module V1
    class JoinsController < ApplicationController
      def index
        joins = Join.where(event_id: params[:event_id])
        render json: joins.as_json(include: { user: { only: %w[id name] } })
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
        @join = Join.find(params[:id])
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