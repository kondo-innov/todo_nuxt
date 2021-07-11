module Api
  module V1
    class AvatarsController < ApplicationController
      protect_from_forgery 
      def create
        @avatar = Avatar.new(controller_params)
        if @avatar.save
          render json: { url: @avatar.image.service_url, messages: '成功' }, stauts: :ok
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