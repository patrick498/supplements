module Api
  module V1
    # BaseController class for shared API stuff
    class BaseController < ApplicationController
      include Pundit

      # Require authentication for all API requests
      before_action :authenticate_user!

      # Handle auth failures from Pundit
      rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

      private

      def user_not_authorized
        render json: { error: "You are not authorized to perform this action." }, status: :forbidden
      end
    end
  end
end
