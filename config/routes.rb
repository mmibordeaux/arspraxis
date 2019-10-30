Rails.application.routes.draw do
  resources :levels
  devise_for :users
  resources :referentials, :competencies
  root to: 'referentials#index'
end
