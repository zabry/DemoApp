class Api::V1::AttemptsController < ApplicationController

    before_action :authorize_request, only: [:create, :update]
    ##End Point called when a user starts the test
    def create
        @attempt = Attempt.new(user_id: @current_user.id, test_module_id: params[:test_module_id])
        @attempt.update_attribute(:started_at, Time.now)
        @attempt.save
        render json: @attempt, status: :ok

    end

    
    ##End Point for finishing a test/Quitting a test
    def update
        @attempt = Attempt.find_by_id(params[:id])
        @attempt.update_attribute(:completed_at, Time.now)

        score = calcuate_score(@attempt)
        @attempt.update_attribute(:score, score)

        @attempt.save
        render json: @attempt, status: :ok

    end

    ##Not used here - Clarify on how to use this
    private

    def attempt_params

        params.permit(:test_module_id, user_id: @current_user.id)

    end


end
