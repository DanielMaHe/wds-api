# frozen_string_literal: true

Rails.application.routes.draw do
  match '*path', to: 'application#cors_preflight_check', via: :options
  # post 'sessions/create'
  post '/sessions' => 'sessions#create'
  delete '/sessions' => 'sessions#destroy'

  resources :workers
  resources :customers
  resources :proyects

  # get '/customers' => 'customers#index'
  # post '/customer/' => 'customers#create'
  # get '/proyects' => 'proyects#index'

  resources :sessions, only: %i[new create destroy]
end
