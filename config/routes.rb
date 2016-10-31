Rails.application.routes.draw do
  get 'categories/new'

  get "categories/show"

  get "sessions/new"

  root "static_pages#home"

  get "users/show"

  get "users/new"

  get "/signup", to: "users#new"

  post "/signup", to: "users#create"

  get  "/login", to: "sessions#new"
  
  post  "/login", to: "sessions#create"
  
  delete  "/logout", to: "sessions#destroy"
  
  resources :users
  resources :categories
  resources :words
  end
