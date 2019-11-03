class CreatePrograms < ActiveRecord::Migration[5.2]
  def change
    create_table :programs do |t|
      t.string :name
      t.string :city
      t.string :country
      t.references :referential, foreign_key: true

      t.timestamps
    end
  end
end
