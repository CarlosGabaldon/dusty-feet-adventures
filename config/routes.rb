Rails.application.routes.draw do
  root 'trails#index'
  get 'trails/location/:state', to: 'trails#location', as: :trails_location
  get 'trails/files/new_upload', to: 'trails#new_upload', as: :trails_new_upload
  post 'trails/files/upload', to: 'trails#upload', as: :trails_upload
  resources :trails
end
