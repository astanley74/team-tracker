Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :teams
  end

  resources :teams do
    resources :players
  end

  resources :players

  resources :leagues

  get '/all_teams', to: 'teams#all_teams'

  get '/auth/:provider/callback', to: 'sessions#omniauth'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  root "application#home"
end