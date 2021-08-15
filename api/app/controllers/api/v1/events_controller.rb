module Api
  module V1
    class EventsController < ApplicationController
      def index
        @events = Event.all.page(params[:page]).order(created_at: 'DESC')
      end 

      def create
        @event = Event.new(event_params)
        if @event.save
          render json: @event, status: :ok
        else
          render json: { status: 400 }
        end
      end

      def show
        @event = Event.find_by(id: params[:event_id])
        render json: @event.as_json(include: :user)
      end

      def update
        @event = Event.find(params[:id])
        if @event.update(event_params)
          render json: @event, status: :ok
        else
          render json: { status: 400 }
        end
      end

      def destroy
        event = Event.find(params[:id])
        if event.destroy
          render json: event, status: 200
        else
          render json: {message: '削除に失敗しました'}, status: 400
        end
      end

      private
        def event_params
          params.permit(:eventname, :datetime, :cityward, :streetaddress, :description).merge(user_id:current_user.id)
        end
    end
  end
end