Rails.application.routes.draw do
  devise_for :users
  get 'patients/index'
  root to: "patients#index"
  resources :patients, only: [:index, :new] do
    resources :kartes, only: [:index, :new, :create]
  end
  resources :users, only: [:edit, :update]
end