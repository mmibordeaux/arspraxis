class CreateCriticalLearnings < ActiveRecord::Migration[5.2]
  def change
    create_table :critical_learnings do |t|
      t.references :competency, foreign_key: true
      t.references :level, foreign_key: true
      t.text :description
      t.integer :number
      t.text :not_reached
      t.text :partially_reached
      t.text :reached
      t.text :over_reached

      t.timestamps
    end
  end
end
