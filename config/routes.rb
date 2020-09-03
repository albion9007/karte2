Rails.application.routes.draw do
  devise_for :users
  get 'patients/index'
  root to: "patients#index"
  resources :users, only: [:edit, :update]
  resources :kartes, only: [:new, :create]
end
