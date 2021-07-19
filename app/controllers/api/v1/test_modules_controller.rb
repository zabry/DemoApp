class Api::V1::TestModulesController < ApplicationController

    before_action :set_chapter
    
    def index
        render json: @chapter.test_modules, status: :ok
    end

    private

    def set_chapter
        @chapter = Chapter.find_by_id(params[:chapter_id])
    end
end
