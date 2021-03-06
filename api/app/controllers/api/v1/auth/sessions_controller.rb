module Api
  module V1
    module Auth
      class SessionsController < DeviseTokenAuth::SessionsController
        wrap_parameters format: []
        # before_action :configure_sign_in_params, only: [:create]
        # GET /resource/sign_in
        # def new
        # super
        # end
        # POST /resource/sign_in
        # def create
        # super
        # end
        # DELETE /resource/sign_out
        # def destroy
        # super
        # end
        # protected
        # If you have extra params to permit, append them to the sanitizer.
        def configure_sign_in_params
          params.permit(%i[email password session])
        end
      end
    end
  end
end
