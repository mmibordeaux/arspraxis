class Referentials::ApplicationController < ApplicationController
  def breadcrumb
    super
    add_breadcrumb 'Référentiels', referentials_path
    add_breadcrumb @referential, @referential
  end
end
