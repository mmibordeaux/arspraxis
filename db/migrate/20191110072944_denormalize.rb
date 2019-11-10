class Denormalize < ActiveRecord::Migration[5.2]
  def change
    add_reference :referential_critical_learnings, :referential, index: true
    add_reference :referential_resources, :referential, index: true
    add_reference :referential_situations, :referential, index: true
  end
end
