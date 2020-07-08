Rails.application.routes.draw do
  resources :users do resources :journals end
  resources :plants, :waters, :journals
  root 'users#welcome'
  get '/signup' => 'users#new'
  get '/signin' => 'users#signin', as: 'login'
  post '/signin' => 'users#login'
  get '/logout' => 'users#logout', as: 'logout'

end
