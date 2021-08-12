Rails.application.routes.draw do

  resources :customizations
  root to: 'sessions#welcome'

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :cars
  resources :brands
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
