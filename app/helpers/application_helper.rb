module ApplicationHelper
  def button_classes
    'btn btn-primary btn-sm'
  end

  def button_classes_danger
    'btn btn-danger btn-sm'
  end

  def save_button(f)
    f.submit 'Enregistrer', class: button_classes
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

  def destroy_button(object)
    return unless can? :destroy, object
    return unless object.persisted?
    link_to 'Supprimer', object, method: :delete, data: { confirm: 'Are you sure?' }, class: button_classes_danger
  end
end
