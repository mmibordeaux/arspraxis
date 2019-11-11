class SituationDependsOnLevel < ActiveRecord::Migration[5.2]
  def change
    remove_reference :referential_situations, :competency
    add_reference :referential_situations, :level, index: true
  end
end
