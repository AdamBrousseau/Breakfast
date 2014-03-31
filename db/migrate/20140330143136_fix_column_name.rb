class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :dentals, :last_cleaning, :last_visit
  end
end
