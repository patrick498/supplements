module Api
  module V1
    class IntakesController < ApplicationController
      def index
        puts "[DEBUG] current_user: #{current_user.inspect}"
        render json: current_user.intakes.includes(:supplement)
      end
    end
  end
end
