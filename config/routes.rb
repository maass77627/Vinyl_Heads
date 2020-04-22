Rails.application.routes.draw do
  resources :artists
  get '/signup' => 'users#new'
post '/signup' => 'users#create'
get '/login', to: 'sessions#new', as: "login"
post '/login', to: 'sessions#create'
resources :users
resources :comments
resources :posts
resources :records
#get '/login', to: 'sessions#new', as: "login"
#post '/login', to: 'sessions#create' 
root 'application#home'
end
