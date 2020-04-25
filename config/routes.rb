Rails.application.routes.draw do
  root to: 'application#home'
  get '/signup' => 'users#new'
post '/signup' => 'users#create'
<<<<<<< HEAD
get '/login', to: "sessions#new", as: "login"
post '/login', to: "sessions#create"
get 'logout', to: "sessions#destroy", as: "logout"
get 'authorized', to: 'sessions#page_requires_login'
=======
get '/login', to: 'sessions#new', as: "login"
post '/sessions', to: 'sessions#create'
get '/logout', to: 'sessions#destroy'
>>>>>>> 792ee71d4d5f803d990291607a895611529ecb45
resources :users
resources :comments
resources :posts
resources :artists
resources :records
<<<<<<< HEAD
resources :genres
=======
get '/auth/facebook/callback' => 'sessions#new'
#get '/login', to: 'sessions#new', as: "login"
#post '/login', to: 'sessions#create' 
root 'application#home'
>>>>>>> 792ee71d4d5f803d990291607a895611529ecb45
end
