Rails.application.routes.draw do

  #home
  root 'gossips#index'

  #pages menu
  get '/contact', to: 'gossips#contact'
  get '/team', to: 'gossips#team'
  get '/welcome/:first_name', to: 'gossips#welcome'
  
  #pages gossips
  resources :gossips
  resources :comments, only: [:create, :edit, :update, :destroy, :new]
  # resources :like, only: [:create, :destroy]
 

  #cities
  resources :cities, only: [:show]
  #users
  resources :users
  
  #sessions
  resources :sessions, only: [:new, :create, :destroy]
  
end
