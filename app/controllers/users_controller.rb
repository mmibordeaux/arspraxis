class UsersController < ApplicationController
  load_and_authorize_resource

  add_breadcrumb 'Utilisateurs', :users_path

  def index
  end

  def show
    add_breadcrumb @user.name
  end
end
