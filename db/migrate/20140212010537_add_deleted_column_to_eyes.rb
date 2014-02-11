class AddDeletedColumnToEyes < ActiveRecord::Migration
  def change
  	add_column :eyes, :deleted, :boolean, default: false
  end
end
