Rails.application.routes.draw do
  namespace :admin do
    resources :sessions, only: %i[new create destroy]
    resources :signup, only: %i[new create]

    resources :departments
    resources :skills
    resources :users do
      member do
        get 'show_image'
      end
    end
  end

  resources :departments, only: %i[index show]
  resources :users, only: %i[index show]
  resources :skills, only: %i[index show]

  get '/auth/:provider/callback', to: 'admin/sessions#omniauth'
  root 'users#index'
end
