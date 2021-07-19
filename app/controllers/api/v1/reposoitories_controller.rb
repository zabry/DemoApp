class Api::V1::ReposoitoriesController < ApplicationController
    
    before_action :set_chapter
    before_action :authorize_request, only: [:show]
    
    
    ##Show all lectures in a chapter
    def index
        render json: @chapter.reposoitories, status: :ok
    end

    
    ## Show pending lectures of an user
    def show
        userrepoprogress = UserRepoProgress.find_by(user_id: @current_user.id)
        repo = Reposoitory.find_by_id(userrepoprogress.reposoitory_id)

        render json: repo, status: :ok
    end



    private

    def set_chapter
        @chapter = Chapter.find_by_id(params[:chapter_id])
    end

end
