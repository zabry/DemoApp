Rails.application.routes.draw do
  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :sessions
        resources :users do
          put 'sendotp' => "users#sendotp"
            resources :attempts do
              resources :attempt_answers
            end
        end
      resources :boards do
        resources :classrooms do
          resources :subjects do
            resources :chapters do
              resources :reposoitories
              resources :test_modules do
                resources :test_questions
              end
            end
          end
        end
      end
    end
  end

  
end
