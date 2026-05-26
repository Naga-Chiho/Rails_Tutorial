Rails.application.routes.draw do
  # get "up" => "rails/health#show", as: :rails_health_check
  # get "/users", to: "users#index"

  # get "/users/new", to: "users#new"
  # post "/users", to: "users#create"

  # get "/users/:id/edit", to: "users#edit"
  # patch "/users/:id", to: "users#update"
  # put "/users/:id", to: "users#update"

  # delete "/users/:id", to: "users#destroy"

  # この子あれば一発よ
  resources :departments, :users, :skills
end