class CreateReferentialManagers < ActiveRecord::Migration[5.2]
  def change
    create_table :referential_managers do |t|
      t.references :referential, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
