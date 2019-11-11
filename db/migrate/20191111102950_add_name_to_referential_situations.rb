class AddNameToReferentialSituations < ActiveRecord::Migration[5.2]
  def change
    add_column :referential_situations, :name, :string
  end
end
