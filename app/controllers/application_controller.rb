class ApplicationController < ActionController::Base
  def breadcrumb
    add_breadcrumb 'Accueil', :root_path
  end
end
