Rails.application.routes.draw do
  root 'trails#index'
  get 'trails/location/:state', to: 'trails#location', as: :trails_location
  resources :trails
end
