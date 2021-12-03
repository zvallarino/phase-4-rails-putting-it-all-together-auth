Rails.application.routes.draw do
  resources :recipes, only: [:index, :create]
  resources :users

  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  post "/signup", to: "users#create"
  get "/me", to: "users#show"
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
