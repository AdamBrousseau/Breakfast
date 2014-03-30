class ChangeMedicationColumnName < ActiveRecord::Migration
  def change
  	rename_column :medications, :medication, :medication_name
  end
end
