module Api
  module V1
    class AvatarsController < ApplicationController
      protect_from_forgery 
      def create
        @avatar = Avatar.new(controller_params)
        if @avatar.save
          render json: { status: 200 }
        else
          render json: @avatar.errors, status: 422
        end
      end

      private

        def name
          File.basename(filename, ".*")
        end

        def filename
          params[:filename]
        end

        def controller_params
          # imageはファイルではなくblob.signed_idが送られてきます
          params.permit(:image , :name)
        end
    end
  end
end