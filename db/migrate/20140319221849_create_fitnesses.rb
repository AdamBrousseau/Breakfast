class CreateFitnesses < ActiveRecord::Migration
  def change
    create_table :fitnesses do |t|
      t.float :weight
      t.float :height
      t.date :date
      t.boolean :deleted
      t.string :references
      t.string :phr

      t.timestamps
    end
  end
end
