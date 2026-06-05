Rails.application.routes.draw do
  namespace :admin do
    resources :departments
    resources :users
    resources :skills
  end

    resources :departments, only: [:index , :show]
    resources :users, only: [:index , :show]
    resources :skills, only: [:index , :show]
end