class Api::V1::AttemptsController < ApplicationController

    
    ##End Point called when a user starts the test
    def create
        @attempt = Attempt.new(attempt_params)
        @attempt.update_attribute(:started_at, Time.now)
        @attempt.save
        render json: @attempt, status: :ok

    end

    
    ##End Point for finishing a test/Quitting a test
    def update
        @attempt = Attempt.find_by_id(params[:id])
        @attempt.update_attribute(:completed_at, Time.now)

        ##Score = CalculateScore(@attempt.id)
        ##@attempt.update_attribute(:score, Score)

        @attempt.save
        render json: @attempt, status: :ok

    end

    private

    def attempt_params

        params.permit(:test_module_id, :user_id)

    end


end
