class Programs::ApplicationController < ApplicationController
  load_and_authorize_resource :program

  def breadcrumb
    super
    add_breadcrumb 'Formations', programs_path
    add_breadcrumb @program, @program
  end
end
