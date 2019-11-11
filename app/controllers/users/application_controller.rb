class Users::ApplicationController < ApplicationController
  load_and_authorize_resource :user

  def breadcrumb
    super
    add_breadcrumb 'Utilisateurs', users_path
    add_breadcrumb @user, @user
  end
end
