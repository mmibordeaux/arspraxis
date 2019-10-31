class RenameFieldsInCompetencies < ActiveRecord::Migration[5.2]
  def change
    rename_column :competencies, :position, :number
    rename_column :competencies, :details, :essential_components
  end
end
