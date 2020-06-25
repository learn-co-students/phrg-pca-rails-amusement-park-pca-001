Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'
  resources :users, only: %i[index show new create update]
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  resource :sessions, only: [:destroy]
  resources :attractions, only: [:index, :new, :create, :show, :edit, :update]
end
