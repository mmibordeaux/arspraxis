class CreateUserStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :user_students do |t|
      t.references :user, foreign_key: true
      t.references :program_group, foreign_key: true
      t.boolean :confirmed, default: false

      t.timestamps
    end
  end
end
