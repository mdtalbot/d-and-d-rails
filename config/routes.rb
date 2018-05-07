Rails.application.routes.draw do
  root 'application#home'

  resources :character_encounters
  resources :monster_encounters
  resources :pets
  resources :characters
  resources :monsters
  resources :encounters

  resources :users
  get '/signup', to: 'users#new', as: 'register'
  get '/login', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create', as: 'sessions'
  post '/logout', to: 'sessions#destroy'
  get '/users/:id/encounters', to: 'encounters#my_encounters', as: 'my_encounters'

end
