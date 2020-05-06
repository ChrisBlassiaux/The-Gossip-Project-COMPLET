Rails.application.routes.draw do

  #home
  root 'gossips#index'

  #pages menu
  get '/contact', to: 'gossips#contact'
  get '/team', to: 'gossips#team'
  get '/welcome/:first_name', to: 'gossips#welcome'
  
  #pages gossips
  resources :gossips do
    resources :comments, only: [:create, :edit, :update, :destroy]
    resources :like, only: [:create, :destroy]
  end

  #cities
  resources :cities, only: [:show]
  #users
  resources :users, only: [:show]
  
end

# Mes Anciennes routes 
  # resources :gossips
  # resources :comments, only: [:create, :new, :destroy, :edit]
