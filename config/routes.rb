# frozen_string_literal: true

Rails.application.routes.draw do
  resources :workers
  resources :customers
  resources :proyects
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/' => 'customers#index'
  get '/proyects' => 'proyects#index'
  get '/workers' => 'workers#index'
  post '/login' => 'customers#create'
end
