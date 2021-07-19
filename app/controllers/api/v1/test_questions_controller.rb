class Api::V1::TestQuestionsController < ApplicationController


    before_action :set_test_module
    
    def index
        render json: @test_module.test_questions, status: :ok
    end

    private

    def set_test_module
        @test_module = TestModule.find_by_id(params[:test_module_id])
    end
end
