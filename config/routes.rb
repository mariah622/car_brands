Rails.application.routes.draw do



  root to: 'sessions#welcome'
  get '/cars/oldest_car', to: 'cars#oldest_car'


  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :customizations
  resources :users
  resources :cars, only: [:index, :new, :create]
   resources :brands do 
    resources :cars, shallow: true 
   end
end 


