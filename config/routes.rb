Rails.application.routes.draw do
  get 'images/new'

  devise_for :users
  root 'trails#index'
  get 'trails/location/:state', to: 'trails#location', as: :trails_location
  resources :trails do
    resources :tags, only: [] do
      member do
        delete :remove
      end
    end
  end
  resources :images, only: [:new]
end
