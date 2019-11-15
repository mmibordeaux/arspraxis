class CreateUserEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :user_evaluations do |t|
      t.references :publication, foreign_key: {to_table: :user_publications}
      t.references :referential_critical_learning, foreign_key: true
      t.references :program_teacher, foreign_key: true
      t.boolean :completeness_validated
      t.text :completeness_comment
      t.boolean :authenticity_validated
      t.text :authenticity_comment
      t.boolean :validity_validated
      t.text :validity_comment
      t.boolean :depth_validated
      t.text :depth_comment
      t.boolean :extent_validated
      t.text :extent_comment
      t.boolean :explanation_validated
      t.text :explanation_comment

      t.timestamps
    end
  end
end
