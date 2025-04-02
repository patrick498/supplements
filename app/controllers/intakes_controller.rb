module Api
  module V1
    class IntakesController < BaseController
      def index
        render current_user.intakes.includes(:supplement)
      end
    end
  end
end
