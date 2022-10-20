Rails.application.routes.draw do
  # get 'services', to: 'services#index'
  # get 'categories', to: 'categories#index'
  # get 'requests', to: 'requests#index'
  root "requests#index"
  
  resources :categories
  resources :requests
  resources :services
end
