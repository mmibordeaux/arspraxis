Rails.application.routes.draw do
  devise_for :users

  resources :referentials do
    resources :competencies, controller: 'referentials/competencies'
    resources :critical_learnings, controller: 'referentials/critical_learnings'
    resources :levels, controller: 'referentials/levels'
    resources :managers, controller: 'referentials/managers'
    resources :resources, controller: 'referentials/resources'
    resources :situations, controller: 'referentials/situations'
  end

  resources :programs do
    resources :teachers, controller: 'programs/teachers'
    resources :groups, controller: 'programs/groups'
  end

  resources :users, only: [:index, :show]

  root to: 'dashboard#index'
end
