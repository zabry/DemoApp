Rails.application.routes.draw do
  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :sessions, only: [:create, :destroy]

      put 'users/sendotp' => "users#sendotp"
        resources :users
            resources :attempts, only: [:create, :update] do
              resources :attempt_answers, only: [:create, :update]
            end
  
      resources :boards, only: [:index] do
        resources :classrooms, only: [:index] do
          resources :subjects, only: [:index] do
            resources :chapters, only: [:index] do

              get 'reposoitories/showpending' => "reposoitories#showpending"
              resources :reposoitories, only: [:index, :show, :create, :update]
              resources :test_modules, only: [:index] do
                resources :test_questions, only: [:index]
              end
            end
          end
        end
      end
    end
  end

  
end
