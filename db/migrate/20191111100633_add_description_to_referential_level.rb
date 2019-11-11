class AddDescriptionToReferentialLevel < ActiveRecord::Migration[5.2]
  def change
    add_column :referential_levels, :description, :text
  end
end
