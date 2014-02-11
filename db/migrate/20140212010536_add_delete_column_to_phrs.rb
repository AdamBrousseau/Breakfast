class AddDeleteColumnToPhrs < ActiveRecord::Migration
  def change
  	add_column :phrs, :deleted, :boolean, default: false
  end
end
