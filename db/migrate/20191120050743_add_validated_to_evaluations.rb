class AddValidatedToEvaluations < ActiveRecord::Migration[5.2]
  def change
    add_column :user_evaluations, :validated, :boolean, default: false
  end
end
