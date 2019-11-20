class RenameProgramTeacherIdInEvaluations < ActiveRecord::Migration[5.2]
  def change
    rename_column :user_evaluations, :program_teacher_id, :user_id
  end
end
