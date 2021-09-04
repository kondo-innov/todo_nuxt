module Api
  module V1
    class UserEventsController < ApplicationController
      def index
        userevent = UserEvent.where(event_id: params[:event_id])
        render json: userevent.as_json(include: { user: { only: %w[id name] } })
      end

      def create
        userevent = UserEvent.new(userevent_params)
        userevent.user_id = current_user.id
        if userevent.save
          render json: userevent, status: :ok
        else
          render json: { message: '参加に失敗しました' }, status: 400
        end
      end

      def destroy
        userevent = UserEvent.find(params[:id])
        userevent.destroy
        render status: 200, json: false
      end

      private

      def userevent_params
        params.permit(:user_id, :event_id)
      end
    end
  end
end
