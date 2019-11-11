class ApplicationController < ActionController::Base
  def breadcrumb
    add_breadcrumb 'Ars Praxis', :root_path
  end
end
