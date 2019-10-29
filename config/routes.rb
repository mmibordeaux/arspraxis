Rails.application.routes.draw do
  devise_for :users
  resources :referentials
  root to: 'referentials#index'
end
