module Api
  module V1
    module Auth
      class RegistrationsController < DeviseTokenAuth::RegistrationsController
        before_action :ensure_normal_user, only: :destroy

        private

        def ensure_normal_user
          if params[:email] == 'guestlogin@gmail.com'
            render json: { message: '失敗しました' }, status: 400
          end
        end

        def sign_up_params
          params.permit(:name, :email, :password, :password_confirmation)
        end

        def account_update_params
          params.permit(:name, :email, :image)
        end
      end
    end
  end
end
