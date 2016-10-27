Rails.application.routes.draw do
  root "static_pages#home"

  get "users/show"

  get "users/new"

  get "/signup", to: "users#new"

  post "/signup", to: "users#create"

  get "static_pages/home"

  resources :users
  
  end
