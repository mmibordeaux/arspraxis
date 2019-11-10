class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    breadcrumb
    add_breadcrumb 'Utilisateurs', users_path
  end

  def show
    breadcrumb
    add_breadcrumb 'Utilisateurs', users_path
    add_breadcrumb @user
  end

  def me
    breadcrumb
    add_breadcrumb 'Mon compte'
  end

  def update
    with_password = !params[:user][:password].blank?
    update = with_password  ? current_user.update_with_password(user_params_with_password)
                            : current_user.update(user_params)
    if update
      redirect_to me_users_path, notice: 'Modifications enregistrées'
      bypass_sign_in current_user
    else
      render :me
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name)
  end

  def user_params_with_password
    params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation, :current_password)
  end
end
