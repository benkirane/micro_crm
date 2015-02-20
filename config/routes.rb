Rails.application.routes.draw do

  root to: 'customers#index'
  resources :customers

end
