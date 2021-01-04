Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users
  resources :users
  resources :recipes
end
