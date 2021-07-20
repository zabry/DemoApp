class Api::V1::TestModulesController < ApplicationController

    before_action :set_chapter
    before_action :authorize_request, only: [:index]

    ##End Point to list all test modules available in a chapter
    
    def index
        render json: @chapter.test_modules, status: :ok
    end

    private

    def set_chapter
        @chapter = Chapter.find_by_id(params[:chapter_id])
    end
end
