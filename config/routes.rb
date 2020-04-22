Rails.application.routes.draw do
  resources :artists
  get '/signup' => 'users#new'
post '/signup' => 'users#create'
get '/login', to: 'sessions#new', as: "login"
post '/sessions', to: 'sessions#create'
get '/logout', to: 'sessions#destroy'
resources :users
resources :comments
resources :posts
resources :records
get '/auth/facebook/callback' => 'sessions#new'
#get '/login', to: 'sessions#new', as: "login"
#post '/login', to: 'sessions#create' 
root 'application#home'
end
