class MakeFitnessDeletedDefaultToFalse < ActiveRecord::Migration
  def change
  	change_column :fitnesses, :deleted, :boolean, :default => false
  end
end
