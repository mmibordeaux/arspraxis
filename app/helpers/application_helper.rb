module ApplicationHelper
  def button_classes
    'btn btn-primary btn-sm'
  end

  def edit_button(object)
    return unless can? :edit, object
    link_to 'Modifier', [:edit, object], class: button_classes
  end

  def create_button(klass, *args)
    return unless can? :create, klass
    path = send "new_#{klass.to_s.underscore}_path", *args
    link_to 'Créer', path, class: button_classes
  end
end
