class Api::V1::ReposoitoriesController < ApplicationController
    
    before_action :set_chapter
    before_action :authorize_request, only: [:show, :create, :showpending, :update]
    
    
    ##Show all lectures in a chapter
    def index
        render json: @chapter.reposoitories, status: :ok
    end

    ## Whenever a lecture is started a new, a record in user_repo_progress is inserted with progress  = 0

    def create

        userrepoprogress = UserRepoProgress.find_or_initialize_by(user_id: @current_user.id, reposoitory_id: params[:id])
        userrepoprogress.update_attribute(:progress, '0.00')

       head(:created)

    end

    ## End Point where users exits a lecture after a certain time
    def update
        userrepoprogress = UserRepoProgress.find_by(user_id: @current_user.id, reposoitory_id: params[:id])
        userrepoprogress.update_attribute(:progress, params[:progress])
    end

    
    ## Show pending lectures of an user
    def showpending
        userrepoprogress = UserRepoProgress.where(user_id: @current_user.id)
        puts userrepoprogress
        repo = []

        userrepoprogress.each do |n|
           repo << Reposoitory.where(id: n.reposoitory_id)
        end
            render json: repo, status: :ok
    end



    private

    def set_chapter
        @chapter = Chapter.find_by_id(params[:chapter_id])
    end

    ## def repo_progress_params
       ## params.permit(:name, @current_user.id)
    ##end

end
