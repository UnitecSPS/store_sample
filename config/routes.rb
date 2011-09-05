AuthSample::Application.routes.draw do

  get "/signup" => 'users#new', :as => :signup
  get "/login" => "user_sessions#new", :as => :login
  resources :user_sessions
  resources :users
  resources :products
  resources :carts
  
  root :to => 'products#index'
end
