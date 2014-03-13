class AddDeletedColumnToMedications < ActiveRecord::Migration
  def change
  	  	add_column :medications, :deleted, :boolean, default: false
  end
end
