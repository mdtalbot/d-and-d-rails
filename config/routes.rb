Rails.application.routes.draw do
  root 'application#home'

  resources :character_encounters
  resources :monster_encounters
  resources :pets
  resources :characters
  resources :monsters
  resources :encounters
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
