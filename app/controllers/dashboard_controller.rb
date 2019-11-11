class DashboardController < ApplicationController
  def index
    if user_signed_in?
      @teacher_in_programs = current_user.teacher_in_programs
      @manager_of_referentials = current_user.manager_of_referentials
      @publications = current_user.publications
      @new_publication = User::Publication.new(user: current_user)
      breadcrumb
      render 'signed_in'
    else
      render 'anonymous'
    end
  end
end
