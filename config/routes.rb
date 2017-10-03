Rails.application.routes.draw do
  get 'sessions/new'

  get 'welcome/index' 

  root 'welcome#index'

  resources :sessions

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"

  root :to => "users#new"

  resources :users

  resources :comments


end
