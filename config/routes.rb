Rails.application.routes.draw do
  get 'images/new'

  devise_for :users
  root 'trails#index'
  get 'trails/location/:state', to: 'trails#location', as: :trails_location
  resources :trails
  resources :images, only: [:new]
end
