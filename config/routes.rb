Rails.application.routes.draw do
  devise_for :users
  resources :referentials, :competencies
  root to: 'referentials#index'
end
