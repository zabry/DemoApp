class Api::V1::AttemptAnswersController < ApplicationController

    before_action :authorize_request, only: [:create, :update]
    ## Whenever we click on submitting an answer for a question
    def create
        @answer = AttemptAnswer.new(answer_params)        
        
        if @answer.save
            render json: @answer, status: :created            
        else
            head(:unprocessable_entity)
        end
    end

    
    ## Whenever an already submitted answer is modified
    def update
        @answer=AttemptAnswer.find_by_id(params[:id])
            
        @answer.update_attribute(:user_answer, params[:user_answer])
        if @answer.user_answer = params[:user_answer]
            render json: @answer, status: :no_content

        else
            head(:unprocessable_entity)

        end
    end

    private
    
    def answer_params
        params.permit(:attempt_id, :test_question_id, :user_answer)
    end
end
