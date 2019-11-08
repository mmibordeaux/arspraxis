class Programs::ApplicationController < ApplicationController
  def breadcrumb
    super
    add_breadcrumb 'Formations', programs_path
    add_breadcrumb @program, @program
  end
end
