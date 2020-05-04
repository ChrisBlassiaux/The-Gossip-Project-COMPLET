Rails.application.routes.draw do

  root 'static_pages#home'
  get '/static_pages/contact', to: 'static_pages#contact'
  get '/static_pages/team', to: 'static_pages#team'
  get '/welcome/:first_name', to: 'dynamic_pages#welcome'
  get '/gossips/:id', to: 'dynamic_pages#gossip'
  get '/user/:id', to: 'dynamic_pages#page_user'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
