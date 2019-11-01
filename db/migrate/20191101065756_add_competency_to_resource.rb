class AddCompetencyToResource < ActiveRecord::Migration[5.2]
  def change
    add_reference :resources, :competency, foreign_key: true
  end
end
