Rails.application.routes.draw do
  get 'attractions/index'

  resources :users
  resources :sessions
  resources :attractions

  post '/rides/new', to: 'rides#new'

  root 'static#home'

  get '/signin', to: 'sessions#new'
  delete '/signout', to: 'sessions#destroy'

end
