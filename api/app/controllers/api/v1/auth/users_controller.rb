module Api
  module V1
    module Auth
      class UsersController < ApplicationController
        def show
          user = current_user
          render json: { user: user }, status: 200
        end
      end
    end
  end
end
