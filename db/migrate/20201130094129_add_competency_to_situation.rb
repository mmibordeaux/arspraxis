class AddCompetencyToSituation < ActiveRecord::Migration[5.2]
  def change
    add_reference :referential_situations, :competency, foreign_key: {to_table: :referential_competencies}
  end
end
