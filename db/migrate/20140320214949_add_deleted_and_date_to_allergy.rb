class AddDeletedAndDateToAllergy < ActiveRecord::Migration
  def change
  	add_column :allergies, :deleted, :boolean, :default => false
  	add_column :allergies, :date, :date
  end
end
