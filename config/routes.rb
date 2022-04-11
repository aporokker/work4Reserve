Rails.application.routes.draw do
  root "users#index"
  
  resources :users, only: [:index, :edit, :update]
  resources :rooms
  resources :reservations, only: [:index, :new, :create, :destroy]

  get "users/account", to: "users#account"
  get "users/posts", to: "users#posts"
  
  devise_for :users, module: :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
