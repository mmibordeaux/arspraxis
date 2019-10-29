class CreateReferentials < ActiveRecord::Migration[5.2]
  def change
    create_table :referentials do |t|
      t.string :name

      t.timestamps
    end
  end
end
