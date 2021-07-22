Rails.application.routes.draw do
  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
            
            post 'sessions/logout' => "sessions#logout"      
            resources :sessions, only: [:create, :logout]

            
            put 'users/sendotp' => "users#sendotp"
            resources :users

            resources :attempts, only: [:create, :update] do
              resources :attempt_answers, only: [:create, :update]
            end

            resources :boards, only: [:index] do
              resources :classrooms, only: [:index]
            end

            resources :classrooms, only: [] do
              resources :subjects, only: [:index]
            end

            resources :subjects, only: [] do
              resources :chapters, only: [:index]
            end
            
            get 'reposoitories/showpending' => "reposoitories#showpending"
            resources :chapters, only: [] do
              resources :reposoitories, only: [:index, :show, :create, :update]
              
            end

            resources :chapters, only: [] do
              resources :test_modules, only: [:index]
            end

            resources :test_modules, only: [] do
              resources :test_questions, only: [:index]
            end

            

  
      #resources :boards, only: [:index] do
       # resources :classrooms, only: [:index] do
        #  resources :subjects, only: [:index] do
         #   resources :chapters, only: [:index] do

          #    get 'reposoitories/showpending' => "reposoitories#showpending"
           ##   resources :reposoitories, only: [:index, :show, :create, :update]
             # resources :test_modules, only: [:index] do
              #  resources :test_questions, only: [:index]
              
    end
  end

  
end
