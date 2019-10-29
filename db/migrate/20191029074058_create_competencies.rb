class CreateCompetencies < ActiveRecord::Migration[5.2]
  def change
    create_table :competencies do |t|
      t.string :name
      t.string :short_name
      t.text :description
      t.integer :position
      t.references :referential, foreign_key: true

      t.timestamps
    end
  end
end
