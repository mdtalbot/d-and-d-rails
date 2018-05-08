Rails.application.routes.draw do
  root 'application#home'

  resources :character_encounters
  resources :monster_encounters
  get "/pets/search", to: "pets#search", as: "pets_search"
  resources :pets
  get "/characters/search", to: "characters#search", as: "characters_search"
  resources :characters
  get "/monsters/search", to: "monsters#search", as: "monsters_search"
  resources :monsters
  get "/encounters/search", to: "encounters#search", as: "encounters_search"
  resources :encounters

  resources :users
  get '/signup', to: 'users#new', as: 'register'
  get '/login', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create', as: 'sessions'
  post '/logout', to: 'sessions#destroy'
  get '/users/:id/encounters', to: 'users#encounters_index', as: 'my_encounters'
  get '/users/:id/encounters/:encounter_id', to: 'users#encounter_show', as: 'my_encounter'

end
