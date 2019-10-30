class CreateLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :levels do |t|
      t.integer :number
      t.string :name
      t.references :referential, foreign_key: true

      t.timestamps
    end
  end
end
