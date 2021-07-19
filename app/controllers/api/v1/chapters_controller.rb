class Api::V1::ChaptersController < ApplicationController

    before_action :set_subject
    
    def index
        render json: @subject.chapters, status: :ok
    end

    private

    def set_subject
        @subject = Subject.find_by_id(params[:subject_id])
    end
end
