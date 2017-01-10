Rails.application.routes.draw do
  root "static_page#home"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users, only: [:index, :show, :edit, :update]
  namespace "admin" do
    resources :users, only: [:index, :destroy]
    resources :categories, except: [:show]
    resources :words, except: [:show]
  end

  resources :users do
    resources :followings, only: [:index]
    resources :followers, only: [:index]
  end

  resources :relationships,  only: [:create, :destroy]
  resources :categories, only: [:index, :show]
end
