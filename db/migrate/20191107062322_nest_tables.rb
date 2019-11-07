class NestTables < ActiveRecord::Migration[5.2]
  def change
    rename_table :competencies, :referential_competencies
    rename_table :critical_learnings, :referential_critical_learnings
    rename_table :levels, :referential_levels
    rename_table :resources, :referential_resources
    rename_table :situations, :referential_situations
    rename_table :groups, :program_groups
  end
end
