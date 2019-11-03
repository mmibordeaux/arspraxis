Rails.application.routes.draw do
  devise_for :users
  resources :referentials, :competencies, :programs, :resources,
            :critical_learnings, :situations, :levels
  root to: 'referentials#index'
end
