class FixingFitnessesModelPhrReferences < ActiveRecord::Migration
  def change
	add_column :fitnesses, :phr_id, :integer
	remove_column :fitnesses, :phr
	remove_column :fitnesses, :references
  end
end
