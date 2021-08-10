Rails.application.routes.draw do

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
  delete '/logout', to: 'sessions#destroy'

  resources :users
  resources :cars
  resources :brands
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
