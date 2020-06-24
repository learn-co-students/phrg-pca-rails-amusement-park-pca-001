Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "static#welcome"
  resources :users, only: [:new, :create, :show]
  resources :attractions, only: [:index, :show]
  resources :rides, only: [:create]

  get "/signin", to: "sessions#new"
  post "/sessions", to: "sessions#create"

  get "/logout", to: "sessions#destroy"
end
