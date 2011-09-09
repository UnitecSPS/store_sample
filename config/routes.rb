AuthSample::Application.routes.draw do

  get "orders/new"

  get "orders/create"

  get "orders/show"

  get "/signup" => 'users#new', :as => :signup
  get "/login" => "user_sessions#new", :as => :login
  resources :user_sessions
  resources :users
  resources :products
  resources :carts
  resources :orders
  
  root :to => 'products#index'
end
