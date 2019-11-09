class Referentials::ApplicationController < ApplicationController
  load_and_authorize_resource :referential

  def breadcrumb
    super
    add_breadcrumb 'Référentiels', referentials_path
    add_breadcrumb @referential, @referential
  end
end
