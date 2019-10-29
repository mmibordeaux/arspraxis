class AddOriginToReferentials < ActiveRecord::Migration[5.2]
  def change
    add_column :referentials, :origin, :string
  end
end
