class CreateUserPublications < ActiveRecord::Migration[5.2]
  def change
    create_table :user_publications do |t|
      t.references :user, foreign_key: true
      t.references :program_group, foreign_key: true
      t.string :title
      t.text :content
      t.boolean :published, default: false

      t.timestamps
    end
  end
end
