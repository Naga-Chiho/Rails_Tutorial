Rails.application.routes.draw do
  namespace :admin do
    resources :departments
    resources :skills
    resources :users do
      member do
        get 'show_image' 
      end
    end
  end

    resources :departments, only: [:index , :show]
    resources :users, only: [:index , :show]
    resources :skills, only: [:index , :show]
end