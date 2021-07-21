class Api::V1::ReposoitoriesController < ApplicationController
    
    before_action :set_chapter
    before_action :authorize_request, only: [:show, :create, :showpending, :update]
    
    
    ##Show all lectures in a chapter
    def index
        render json: @chapter.reposoitories, status: :ok
    end

    ## Whenever a lecture is started a new, a record in user_repo_progress is inserted with progress  = 0

    def create

        @user_repo_progress = UserRepoProgress.find_or_initialize_by(user_id: @current_user.id, reposoitory_id: params[:reposoitory_id])
        @user_repo_progress.update_attribute(:progress, '0.00')
        @user_repo_progress.save

       head(:created)

    end

    ## End Point where users exits a lecture after a certain time
    def update
        
        @user_repo_progress = UserRepoProgress.find_by(user_id: @current_user.id, reposoitory_id: params[:id])
        @user_repo_progress.update_attribute(:progress, params[:progress])
        @user_repo_progress.save
        

        head(:ok)
    end

    
    ## Show pending lectures of an user ?????JOINS IN RAILS
    def showpending
        ##user_repo_progress = UserRepoProgress.where(user_id: @current_user.id)
        ## repo = []

        ##user_repo_progress.each do |n|
          ## repo << Reposoitory.where(id: n.reposoitory_id)
        ##end

        repo = @current_user.reposoitories
        puts repo
        
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
