Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/buy', to: 'users#buy'

  namespace :admin do
    resources :users, only: [:show, :new, :create]
    resources :rewards, only: [:index, :new, :create, :edit, :update, :destroy]
    patch 'manage-points', to: 'users#manage_points'
  end

  resources :rewards, only: [:index]
end
