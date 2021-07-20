class Api::V1::BoardsController < ApplicationController

    before_action :authorize_request, only: [:index]
    def index
        @board = Board.all
        render json: @board, status: :ok
    end
end
