Rails.application.routes.draw do
  resources :users do resources :journals end
  resources :plants, :waters, :journals
  root 'users#welcome'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/signin' => 'sessions#signin'
  post '/signin' => 'sessions#login'
  get '/logout' => 'sessions#logout', as: 'logout'
  get '/auth/facebook/callback' => 'sessions#create'
  get '/difficult' => 'plants#most_difficult'
  get '/water/:id' => 'journals#water'
  
end
