Rails.application.routes.draw do
  resources :resources
  resources :critical_learnings
  resources :situations
  resources :levels
  devise_for :users
  resources :referentials, :competencies
  root to: 'referentials#index'
end
