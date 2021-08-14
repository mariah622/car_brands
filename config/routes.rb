Rails.application.routes.draw do
  resources :customizations

  root to: 'sessions#welcome'

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :users
  resources :cars, only: [:index, :new, :create]
   resources :brands do 
    resources :cars, shallow: true 
   end
end 


