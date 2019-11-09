class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    breadcrumb
  end

  def show
    breadcrumb
    add_breadcrumb @user
  end

  protected

  def breadcrumb
    super
    add_breadcrumb 'Utilisateurs', users_path
  end
end
