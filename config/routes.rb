Rails.application.routes.draw do
  root "requests#index"

  get 'about', to: 'about#index'
  get 'search', to: 'requests#search'
  
  resources :categories
  resources :requests
  resources :services
end
