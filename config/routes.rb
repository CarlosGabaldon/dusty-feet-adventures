Rails.application.routes.draw do
  root 'trails#index'
  resources :trails
end
