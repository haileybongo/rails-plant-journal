Rails.application.routes.draw do
  resources :users do resources :journals end
  resources :plants, :waters, :journals
  root 'users#welcome'
  get '/signup' => 'users#new'
  get '/signin' => 'sessions#signin'
  post '/signin' => 'sessions#login'
  get '/logout' => 'sessions#logout', as: 'logout'
  get '/auth/facebook/callback' => 'sessions#create'

end
