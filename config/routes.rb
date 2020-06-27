Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'application#index'

  resources :users, only:[:index, :new, :create, :show]
  resources :attractions
  resources :rides, only:[:create]

  get '/signin', to: 'sessions#new'
  post '/session', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'
end