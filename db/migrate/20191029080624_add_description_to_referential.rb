class AddDescriptionToReferential < ActiveRecord::Migration[5.2]
  def change
    add_column :referentials, :description, :text
  end
end
