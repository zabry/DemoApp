class Api::V1::SubjectsController < ApplicationController

    before_action :set_classroom
    before_action :set_board
    before_action :authorize_request, only: [:index]
    
    def index
        render json: @classroom.subjects, status: :ok
    end

    private

    def set_classroom
        @classroom = Classroom.find_by_id(params[:classroom_id])
    end

    def set_board
        @board = Board.find_by_id(params[:board_id])
    end

end
