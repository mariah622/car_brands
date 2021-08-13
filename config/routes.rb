Rails.application.routes.draw do
\
  root to: 'sessions#welcome'

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :users
  resources :cars
  resources :brands
  resources :customizations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


# resources :cars, only: [:index, :new, :create]
# resources :brands do 
#   resources :cars, shallow: true 
#  end