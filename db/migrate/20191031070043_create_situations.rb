class CreateSituations < ActiveRecord::Migration[5.2]
  def change
    create_table :situations do |t|
      t.text :description
      t.integer :number
      t.references :competency, foreign_key: true

      t.timestamps
    end
  end
end
