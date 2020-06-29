Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :rides, ony: [:create]

  resources :users, only: [:index, :new, :create, :show]

  resources :attractions

  root 'application#home'

  get '/signin', to: 'sessions#signin'
  post '/session', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'
end
