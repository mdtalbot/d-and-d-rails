Rails.application.routes.draw do
  root 'application#home'

  resources :character_encounters
  resources :monster_encounters
  resources :pets
  resources :characters
  resources :monsters
  resources :encounters
  get "/search", to: "encounters#search", as: "encounters_search"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
