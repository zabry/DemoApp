class Api::V1::TestQuestionsController < ApplicationController


    before_action :set_test_module
    before_action :authorize_request, only: [:index]

    ##End point to view all test questions in a test Module
    
    def index
        render json: @test_module.test_questions, status: :ok
    end

    private

    def set_test_module
        @test_module = TestModule.find_by_id(params[:test_module_id])
    end
end
