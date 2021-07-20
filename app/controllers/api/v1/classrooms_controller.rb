class Api::V1::ClassroomsController < ApplicationController

    before_action :set_board
    before_action :authorize_request, only: [:index]
    
    def index
        render json: @board.classrooms, status: :ok
    end

    private

    def set_board
        @board = Board.find_by_id(params[:board_id])
    end


end
