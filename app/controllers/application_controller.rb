class ApplicationController < ActionController::API
  include Pundit::Authorization

  before_action :authenticate_user!

  private

  def authenticate_user!
    unless current_user
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end

  def current_user
    Rails.logger.debug "[DEBUG] 🔍 Warden: #{warden.inspect}"
    user = warden.authenticate(scope: :api_v1_user)
    Rails.logger.debug "[DEBUG] 👤 Authenticated user: #{user.inspect}"
    @current_user ||= user
  end

  def warden
    Rails.logger.debug "[DEBUG] 🧠 env['warden']: #{request.env['warden'].inspect}"
    request.env['warden']
  end
end
