module ExceptionHandler
    # provides the more graceful `included` method
    extend ActiveSupport::Concern

    class InvalidParameters < StandardError
    end
  
    included do
      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: { message: e.message }, status: :not_found
      end
  
      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: { message: e.message }, status: :unprocessable_entity
      end

      rescue_from ActiveRecord::NotNullViolation do |e|
        render json: { message: e.message }, status: :unprocessable_entity
      end

      rescue_from NoMethodError do |e|
        render json: { message: e.message }, status: :not_found
      end 

      ##rescue_from ActionController::ParameterMissing do |e|
       ## render json: { message: e.message }, status: :unprocessable_entity
      ##end 

    end
  end