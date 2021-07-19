class Api::V1::AttemptAnswersController < ApplicationController

    
    ## Whenever we click on submitting an answer for a question
    def create
        @answer = AttemptAnswer.new(answer_params)
        @answer.save
        render json: @answer, status: :ok
    end

    
    ## Whenever an already submitted answer is modified
    def update
        @answer=AttemptAnswer.find_by_id(params[:id])
        @answer.update_attribute(:user_answer, params[:user_answer])

        render json: @answer, status: :ok
    end

    private
    
    def answer_params
        params.permit(:attempt_id, :test_question_id, :user_answer)
    end
end
