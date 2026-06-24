Rails.application.routes.draw do
  namespace :admin do
    resources :sessions, only: [:new, :create, :destroy]           
    
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

    get '/auth/:provider/callback', to: 'admin/sessions#omniauth'
    root "users#index" 
end