Rails.application.routes.draw do
  get '/', to: 'application#home'
  get '/signup', to: 'users#new'
post '/signup', to: 'users#create'
get '/login', to: "sessions#new", as: "login"
post '/login', to: "sessions#create"
get '/logout', to: "sessions#destroy", as: "logout"
#get 'authorized', to: 'sessions#page_requires_login'
get '/auth/facebook/callback' => 'sessions#facebook' #changedfromcreate

resources :artists, only: [:index, :show] do###
  # nested resource for posts
  resources :posts, only: [:show, :index]
end

resources :users

resources :posts
resources :comments
resources :artists
resources :records
resources :genres
end
