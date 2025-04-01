class IntakesController < ApplicationController
  include Pundit
  # Rescue from unauthorized access
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :authenticate_user!

  def index
    @intakes = policy_scope(Intake).sorted_by('time_of_day', 'asc')
  end

  private

  def sort_intakes(intakes, sort)
    sorted_intakes = intakes.order(time_of_day: :asc)
    return sorted_intakes
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referer || root_path)
  end
end
