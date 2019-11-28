class DocumentationController < ApplicationController
  def index
    breadcrumb
  end

  def students
    breadcrumb
    add_breadcrumb 'Pour les apprenants'
  end

  def teachers
    breadcrumb
    add_breadcrumb 'Pour les enseignants'
  end

  def university
    breadcrumb
    add_breadcrumb 'Pour la communauté universitaire'
  end

  def developers
    breadcrumb
    add_breadcrumb 'Pour les développeurs'
  end

  protected

  def breadcrumb
    super
    add_breadcrumb 'Comment ça marche?', documentation_path
  end
end
