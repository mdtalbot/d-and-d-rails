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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
