class RenameProgramGroupIdInStudents < ActiveRecord::Migration[5.2]
  def change
    rename_column :user_students, :program_group_id, :group_id
  end
end
