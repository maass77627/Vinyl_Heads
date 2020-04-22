Rails.application.routes.draw do
  root to: 'application#home'
  resources :artists
  get '/signup' => 'users#new'
post '/signup' => 'users#create'
resources :users
resources :comments
resources :posts
resources :records
get '/login', to: "sessions#new", as: "login"
post '/login', to: "sessions#create"
end
