module ApplicationHelper
  def button_classes
    'btn btn-primary btn-sm mb-1'
  end

  def button_classes_danger
    'btn btn-danger btn-sm mb-1'
  end

  def save_button(f)
    f.submit 'Enregistrer', class: button_classes
  end

  def create_button(object, path)
    return unless can? :create, object
    link_to 'Créer', path, class: button_classes
  end

  def show_button(object, path = nil)
    last_object = object.is_a?(Array) ? object.last
                                      : object
    return unless can? :show, last_object
    link_to 'Voir', nested_path(object), class: button_classes
  end

  def edit_button(object, path = nil)
    last_object = object.is_a?(Array) ? object.last
                                      : object
    return unless can? :edit, last_object
    link_to 'Modifier', nested_path(object, :edit), class: button_classes
  end

  def destroy_button(object)
    last_object = object.is_a?(Array) ? object.last
                                      : object
    return unless can? :destroy, last_object
    return unless last_object.persisted?
    link_to 'Supprimer', nested_path(object), method: :delete, data: { confirm: 'Are you sure?' }, class: button_classes_danger
  end

  def nested_path(class_or_array, prefix = nil)
    if class_or_array.is_a?(Array)
      # Nested path
      method = ''
      method += "#{prefix}_" unless prefix.nil?
      args = []
      class_or_array.each do |o|
        method += "#{o.class.name.demodulize.underscore.downcase}_"
        args << o
      end
      method += 'path'
      path = send method, *args
    else
      # Auto path generation
      path = prefix.blank?  ? class_or_array
                            : [prefix, class_or_array]
    end
  end
end
