class AddDeletedColumnToTests < ActiveRecord::Migration
  def change
    add_column :tests, :deleted, :boolean, default: false
  end
end
