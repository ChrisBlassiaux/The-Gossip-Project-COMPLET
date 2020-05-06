Rails.application.routes.draw do

  root 'gossips#index'
  get '/contact', to: 'gossips#contact'
  get '/team', to: 'gossips#team'
  get '/welcome/:first_name', to: 'gossips#welcome'
  
  get '/user/:id', to: 'gossips#page_user'

  resources :gossips
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
