Rails.application.routes.draw do
  # resources :character_encounters
  # resources :monster_encounters
  resources :char_class, only: [:index, :show]
  resources :char_race, only: [:index, :show]
  resources :alignment, only: [:index, :show]

  get "/pets/search", to: "pets#search", as: "pets_search"
  # resources :pets
  get "/characters/search", to: "characters#search", as: "characters_search"
  resources :characters
  get "/monsters/search", to: "monsters#search", as: "monsters_search"
  resources :monsters
  get "/encounters/search", to: "encounters#search", as: "encounters_search"
  get "/encounters/preview", to: "encounters#preview", as: "encounter_preview"
  get "/encounters/:id/edit/preview", to: "encounters#edit_preview", as: "edit_encounter_preview"
  resources :encounters


  get '/login', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create', as: 'sessions'
  post '/logout', to: 'sessions#destroy'

  resources :users, except: :index
  get '/signup', to: 'users#new', as: 'register'

  get '/users/:id/encounters', to: 'users#encounters_index', as: 'my_encounters'
  get '/users/:id/encounters/:encounter_id', to: 'users#encounter_show', as: 'my_encounter'

  get '/users/:id/characters', to: 'users#characters_index', as: 'my_characters'
  get '/users/:id/characters/:character_id', to: 'users#character_show', as: 'my_character'

  get '/users/:id/monsters', to: 'users#monsters_index', as: 'my_monsters'
  get '/users/:id/monsters/:monster_id', to: 'users#monster_show', as: 'my_monster'

  root 'application#home'
  get '/analytics', to: 'application#analytics'

  get "*path", to: 'application#redirect'
end
