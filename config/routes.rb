Rails.application.routes.draw do
  root to: 'application#home'
  get '/signup' => 'users#new'
post '/signup' => 'users#create'
get '/login', to: "sessions#new", as: "login"
post '/login', to: "sessions#create"
get 'logout', to: "sessions#destroy", as: "logout"
resources :users
resources :comments
resources :posts
resources :artists
resources :records
end
