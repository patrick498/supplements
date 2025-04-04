module Api
  module V1
    class SessionsController < BaseController
      respond_to :json
      skip_before_action :authenticate_user!, only: [:create]

      def create
        user = User.find_for_database_authentication(email: params[:user][:email])

        if user&.valid_password?(params[:user][:password])
          # Manually encode the token
          token = Warden::JWTAuth::UserEncoder.new.call(user, :api_v1_user, nil).first

          render json: {
            message: "Logged in successfully (manual encode)",
            user: user,
            token: token
          }, status: :ok
        else
          render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
      end

      def destroy
        sign_out(current_user)
        head :no_content
      end

      private

      def auth_options
        { scope: :user }
      end
    end
  end
end
