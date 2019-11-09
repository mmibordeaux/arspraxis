class CreateProgramTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :program_teachers do |t|
      t.references :program, foreign_key: true
      t.references :user, foreign_key: true
      t.string :role
      t.text :details

      t.timestamps
    end
  end
end
