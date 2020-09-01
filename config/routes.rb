Rails.application.routes.draw do
  get 'patients/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "patients#index"
end
