class Api::V1::BoardsController < ApplicationController

    def index
        @board = Board.all
        render json: @board, status: :ok
    end
end
