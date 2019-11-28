class DashboardController < ApplicationController
  def index
    if user_signed_in?
      @student_in_groups = current_user.student_in_groups
      @teacher_in_programs = current_user.teacher_in_programs
      @manager_of_referentials = current_user.manager_of_referentials
      @publications = current_user.publications
      @new_publication = User::Publication.new(user: current_user)
      breadcrumb
    else
      render 'documentation/index'
    end
  end
end
