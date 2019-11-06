Rails.application.routes.draw do
  devise_for :users
  resources :referentials, :competencies, :programs, :resources,
            :critical_learnings, :situations, :levels
  resources :users, only: [:index, :show]
  root to: 'dashboard#index'
end
