Rails.application.routes.draw do
  resources :referentials
  root to: 'referentials#index'
end
