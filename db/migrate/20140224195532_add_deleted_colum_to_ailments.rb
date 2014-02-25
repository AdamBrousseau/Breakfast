class AddDeletedColumToAilments < ActiveRecord::Migration
  def change
  	add_column :ailments, :deleted, :boolean, default: false
  end
end
