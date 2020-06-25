Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :rides

  resources :users

  resources :attractions

  root 'application#home'

  get '/signin', to: 'sessions#signin'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
