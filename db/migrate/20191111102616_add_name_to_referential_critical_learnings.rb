class AddNameToReferentialCriticalLearnings < ActiveRecord::Migration[5.2]
  def change
    add_column :referential_critical_learnings, :name, :string
  end
end
