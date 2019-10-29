class AddDetailsToCompetency < ActiveRecord::Migration[5.2]
  def change
    add_column :competencies, :details, :text
  end
end
