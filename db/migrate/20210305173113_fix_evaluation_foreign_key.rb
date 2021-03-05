class FixEvaluationForeignKey < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :user_evaluations, :program_teachers
    add_foreign_key :user_evaluations, :users
  end
end
