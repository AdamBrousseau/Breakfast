class AddDeletedColumnToEverything < ActiveRecord::Migration
  def change
  	add_column :appointments, :deleted, :boolean, :default => false
  	add_column :bglucoses, :deleted, :boolean, :default => false
  	add_column :contacts, :deleted, :boolean, :default => false
  	add_column :dentals, :deleted, :boolean, :default => false
  	add_column :immunizations, :deleted, :boolean, :default => false

  end
end
