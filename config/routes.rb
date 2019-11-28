# == Route Map
#
#                             Prefix Verb   URI Pattern                                                                              Controller#Action
#                   new_user_session GET    /users/sign_in(.:format)                                                                 devise/sessions#new
#                       user_session POST   /users/sign_in(.:format)                                                                 devise/sessions#create
#               destroy_user_session DELETE /users/sign_out(.:format)                                                                devise/sessions#destroy
#                  new_user_password GET    /users/password/new(.:format)                                                            devise/passwords#new
#                 edit_user_password GET    /users/password/edit(.:format)                                                           devise/passwords#edit
#                      user_password PATCH  /users/password(.:format)                                                                devise/passwords#update
#                                    PUT    /users/password(.:format)                                                                devise/passwords#update
#                                    POST   /users/password(.:format)                                                                devise/passwords#create
#           cancel_user_registration GET    /users/cancel(.:format)                                                                  devise/registrations#cancel
#              new_user_registration GET    /users/sign_up(.:format)                                                                 devise/registrations#new
#             edit_user_registration GET    /users/edit(.:format)                                                                    devise/registrations#edit
#                  user_registration PATCH  /users(.:format)                                                                         devise/registrations#update
#                                    PUT    /users(.:format)                                                                         devise/registrations#update
#                                    DELETE /users(.:format)                                                                         devise/registrations#destroy
#                                    POST   /users(.:format)                                                                         devise/registrations#create
#           referential_competencies GET    /referentials/:referential_id/competencies(.:format)                                     referentials/competencies#index
#                                    POST   /referentials/:referential_id/competencies(.:format)                                     referentials/competencies#create
#         new_referential_competency GET    /referentials/:referential_id/competencies/new(.:format)                                 referentials/competencies#new
#        edit_referential_competency GET    /referentials/:referential_id/competencies/:id/edit(.:format)                            referentials/competencies#edit
#             referential_competency GET    /referentials/:referential_id/competencies/:id(.:format)                                 referentials/competencies#show
#                                    PATCH  /referentials/:referential_id/competencies/:id(.:format)                                 referentials/competencies#update
#                                    PUT    /referentials/:referential_id/competencies/:id(.:format)                                 referentials/competencies#update
#                                    DELETE /referentials/:referential_id/competencies/:id(.:format)                                 referentials/competencies#destroy
#     referential_critical_learnings GET    /referentials/:referential_id/critical_learnings(.:format)                               referentials/critical_learnings#index
#                                    POST   /referentials/:referential_id/critical_learnings(.:format)                               referentials/critical_learnings#create
#  new_referential_critical_learning GET    /referentials/:referential_id/critical_learnings/new(.:format)                           referentials/critical_learnings#new
# edit_referential_critical_learning GET    /referentials/:referential_id/critical_learnings/:id/edit(.:format)                      referentials/critical_learnings#edit
#      referential_critical_learning GET    /referentials/:referential_id/critical_learnings/:id(.:format)                           referentials/critical_learnings#show
#                                    PATCH  /referentials/:referential_id/critical_learnings/:id(.:format)                           referentials/critical_learnings#update
#                                    PUT    /referentials/:referential_id/critical_learnings/:id(.:format)                           referentials/critical_learnings#update
#                                    DELETE /referentials/:referential_id/critical_learnings/:id(.:format)                           referentials/critical_learnings#destroy
#                 referential_levels GET    /referentials/:referential_id/levels(.:format)                                           referentials/levels#index
#                                    POST   /referentials/:referential_id/levels(.:format)                                           referentials/levels#create
#              new_referential_level GET    /referentials/:referential_id/levels/new(.:format)                                       referentials/levels#new
#             edit_referential_level GET    /referentials/:referential_id/levels/:id/edit(.:format)                                  referentials/levels#edit
#                  referential_level GET    /referentials/:referential_id/levels/:id(.:format)                                       referentials/levels#show
#                                    PATCH  /referentials/:referential_id/levels/:id(.:format)                                       referentials/levels#update
#                                    PUT    /referentials/:referential_id/levels/:id(.:format)                                       referentials/levels#update
#                                    DELETE /referentials/:referential_id/levels/:id(.:format)                                       referentials/levels#destroy
#               referential_managers GET    /referentials/:referential_id/managers(.:format)                                         referentials/managers#index
#                                    POST   /referentials/:referential_id/managers(.:format)                                         referentials/managers#create
#            new_referential_manager GET    /referentials/:referential_id/managers/new(.:format)                                     referentials/managers#new
#           edit_referential_manager GET    /referentials/:referential_id/managers/:id/edit(.:format)                                referentials/managers#edit
#                referential_manager GET    /referentials/:referential_id/managers/:id(.:format)                                     referentials/managers#show
#                                    PATCH  /referentials/:referential_id/managers/:id(.:format)                                     referentials/managers#update
#                                    PUT    /referentials/:referential_id/managers/:id(.:format)                                     referentials/managers#update
#                                    DELETE /referentials/:referential_id/managers/:id(.:format)                                     referentials/managers#destroy
#              referential_resources GET    /referentials/:referential_id/resources(.:format)                                        referentials/resources#index
#                                    POST   /referentials/:referential_id/resources(.:format)                                        referentials/resources#create
#           new_referential_resource GET    /referentials/:referential_id/resources/new(.:format)                                    referentials/resources#new
#          edit_referential_resource GET    /referentials/:referential_id/resources/:id/edit(.:format)                               referentials/resources#edit
#               referential_resource GET    /referentials/:referential_id/resources/:id(.:format)                                    referentials/resources#show
#                                    PATCH  /referentials/:referential_id/resources/:id(.:format)                                    referentials/resources#update
#                                    PUT    /referentials/:referential_id/resources/:id(.:format)                                    referentials/resources#update
#                                    DELETE /referentials/:referential_id/resources/:id(.:format)                                    referentials/resources#destroy
#             referential_situations GET    /referentials/:referential_id/situations(.:format)                                       referentials/situations#index
#                                    POST   /referentials/:referential_id/situations(.:format)                                       referentials/situations#create
#          new_referential_situation GET    /referentials/:referential_id/situations/new(.:format)                                   referentials/situations#new
#         edit_referential_situation GET    /referentials/:referential_id/situations/:id/edit(.:format)                              referentials/situations#edit
#              referential_situation GET    /referentials/:referential_id/situations/:id(.:format)                                   referentials/situations#show
#                                    PATCH  /referentials/:referential_id/situations/:id(.:format)                                   referentials/situations#update
#                                    PUT    /referentials/:referential_id/situations/:id(.:format)                                   referentials/situations#update
#                                    DELETE /referentials/:referential_id/situations/:id(.:format)                                   referentials/situations#destroy
#                       referentials GET    /referentials(.:format)                                                                  referentials#index
#                                    POST   /referentials(.:format)                                                                  referentials#create
#                    new_referential GET    /referentials/new(.:format)                                                              referentials#new
#                   edit_referential GET    /referentials/:id/edit(.:format)                                                         referentials#edit
#                        referential GET    /referentials/:id(.:format)                                                              referentials#show
#                                    PATCH  /referentials/:id(.:format)                                                              referentials#update
#                                    PUT    /referentials/:id(.:format)                                                              referentials#update
#                                    DELETE /referentials/:id(.:format)                                                              referentials#destroy
#                   program_teachers GET    /programs/:program_id/teachers(.:format)                                                 programs/teachers#index
#                                    POST   /programs/:program_id/teachers(.:format)                                                 programs/teachers#create
#                new_program_teacher GET    /programs/:program_id/teachers/new(.:format)                                             programs/teachers#new
#               edit_program_teacher GET    /programs/:program_id/teachers/:id/edit(.:format)                                        programs/teachers#edit
#                    program_teacher GET    /programs/:program_id/teachers/:id(.:format)                                             programs/teachers#show
#                                    PATCH  /programs/:program_id/teachers/:id(.:format)                                             programs/teachers#update
#                                    PUT    /programs/:program_id/teachers/:id(.:format)                                             programs/teachers#update
#                                    DELETE /programs/:program_id/teachers/:id(.:format)                                             programs/teachers#destroy
#                     program_groups GET    /programs/:program_id/groups(.:format)                                                   programs/groups#index
#                                    POST   /programs/:program_id/groups(.:format)                                                   programs/groups#create
#                  new_program_group GET    /programs/:program_id/groups/new(.:format)                                               programs/groups#new
#                 edit_program_group GET    /programs/:program_id/groups/:id/edit(.:format)                                          programs/groups#edit
#                      program_group GET    /programs/:program_id/groups/:id(.:format)                                               programs/groups#show
#                                    PATCH  /programs/:program_id/groups/:id(.:format)                                               programs/groups#update
#                                    PUT    /programs/:program_id/groups/:id(.:format)                                               programs/groups#update
#                                    DELETE /programs/:program_id/groups/:id(.:format)                                               programs/groups#destroy
#                           programs GET    /programs(.:format)                                                                      programs#index
#                                    POST   /programs(.:format)                                                                      programs#create
#                        new_program GET    /programs/new(.:format)                                                                  programs#new
#                       edit_program GET    /programs/:id/edit(.:format)                                                             programs#edit
#                            program GET    /programs/:id(.:format)                                                                  programs#show
#                                    PATCH  /programs/:id(.:format)                                                                  programs#update
#                                    PUT    /programs/:id(.:format)                                                                  programs#update
#                                    DELETE /programs/:id(.:format)                                                                  programs#destroy
#                  user_publications GET    /users/:user_id/publications(.:format)                                                   users/publications#index
#                                    POST   /users/:user_id/publications(.:format)                                                   users/publications#create
#               new_user_publication GET    /users/:user_id/publications/new(.:format)                                               users/publications#new
#              edit_user_publication GET    /users/:user_id/publications/:id/edit(.:format)                                          users/publications#edit
#                   user_publication GET    /users/:user_id/publications/:id(.:format)                                               users/publications#show
#                                    PATCH  /users/:user_id/publications/:id(.:format)                                               users/publications#update
#                                    PUT    /users/:user_id/publications/:id(.:format)                                               users/publications#update
#                                    DELETE /users/:user_id/publications/:id(.:format)                                               users/publications#destroy
#                   user_evaluations GET    /users/:user_id/evaluations(.:format)                                                    users/evaluations#index
#                                    POST   /users/:user_id/evaluations(.:format)                                                    users/evaluations#create
#                new_user_evaluation GET    /users/:user_id/evaluations/new(.:format)                                                users/evaluations#new
#               edit_user_evaluation GET    /users/:user_id/evaluations/:id/edit(.:format)                                           users/evaluations#edit
#                    user_evaluation GET    /users/:user_id/evaluations/:id(.:format)                                                users/evaluations#show
#                                    PATCH  /users/:user_id/evaluations/:id(.:format)                                                users/evaluations#update
#                                    PUT    /users/:user_id/evaluations/:id(.:format)                                                users/evaluations#update
#                                    DELETE /users/:user_id/evaluations/:id(.:format)                                                users/evaluations#destroy
#                      user_students GET    /users/:user_id/students(.:format)                                                       users/students#index
#                                    POST   /users/:user_id/students(.:format)                                                       users/students#create
#                   new_user_student GET    /users/:user_id/students/new(.:format)                                                   users/students#new
#                  edit_user_student GET    /users/:user_id/students/:id/edit(.:format)                                              users/students#edit
#                       user_student GET    /users/:user_id/students/:id(.:format)                                                   users/students#show
#                                    PATCH  /users/:user_id/students/:id(.:format)                                                   users/students#update
#                                    PUT    /users/:user_id/students/:id(.:format)                                                   users/students#update
#                                    DELETE /users/:user_id/students/:id(.:format)                                                   users/students#destroy
#                           me_users GET    /users/me(.:format)                                                                      users#me
#                                    PATCH  /users/me(.:format)                                                                      users#update
#                              users GET    /users(.:format)                                                                         users#index
#                               user GET    /users/:id(.:format)                                                                     users#show
#         documentation_for_students GET    /documentation-for-students(.:format)                                                    documentation#students
#         documentation_for_teachers GET    /documentation-for-teachers(.:format)                                                    documentation#teachers
#       documentation_for_university GET    /documentation-for-university(.:format)                                                  documentation#university
#       documentation_for_developers GET    /documentation-for-developers(.:format)                                                  documentation#developers
#                               root GET    /                                                                                        dashboard#index
#                 rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#          rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#                 rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#          update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#               rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

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

  resources :users, only: [:index, :show] do
    resources :publications, controller: 'users/publications'
    resources :evaluations, controller: 'users/evaluations'
    resources :students, controller: 'users/students'
    collection do
      get 'me' => 'users#me', as: :me
      patch 'me' => 'users#update'
    end
  end

  scope :documentation do
    get 'for-students' => 'documentation#students', as: :documentation_for_students
    get 'for-teachers' => 'documentation#teachers', as: :documentation_for_teachers
    get 'for-university' => 'documentation#university', as: :documentation_for_university
    get 'for-developers' => 'documentation#developers', as: :documentation_for_developers
    root to: 'documentation#index', as: :documentation
  end

  root to: 'dashboard#index'
end
