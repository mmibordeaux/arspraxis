class ApplicationController < ActionController::Base
  def breadcrumb
    add_breadcrumb 'Accueil', :root_path
  end

  # def current_user; User.find 13; end
end
