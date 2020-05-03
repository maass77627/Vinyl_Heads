Rails.application.routes.draw do
  resources :categories
  resources :wishboards
  resources :lists
  get '/', to: 'application#home'
  get '/signup', to: 'users#new'
post '/signup', to: 'users#create'
get '/login', to: "sessions#new", as: "login"
post '/login', to: "sessions#create"
get '/logout', to: "sessions#destroy", as: "logout"
#get 'authorized', to: 'sessions#page_requires_login'
get '/auth/facebook/callback' => 'sessions#facebook' #changedfromcreate
#get '/delete', to: "posts#destroy", as: "delete"
resources :genres, only: [:show] do
  # nested resource for posts
 resources :posts, only: [:show, :index]
end

resources :users
resources :wishboard
resources :posts
resources :comments
resources :artists
resources :records
resources :genres
end
