module Api
  module V1
    class EventsController < ApplicationController
      protect_from_forgery
      def index
        events = Event.all.page(params[:page]).per(5).order(created_at: 'DESC')
        render json: events
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

      end

      def delete
      end

      private
        def event_params
          params.permit(:eventname, :datetime, :cityward, :streetaddress, :description).merge(user_id:current_user.id)
        end
    end
  end
end