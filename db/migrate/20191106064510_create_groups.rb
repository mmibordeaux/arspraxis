class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.integer :year
      t.references :program, foreign_key: true

      t.timestamps
    end
  end
end
