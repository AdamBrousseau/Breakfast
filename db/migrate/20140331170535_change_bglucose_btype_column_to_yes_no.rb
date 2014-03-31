class ChangeBglucoseBtypeColumnToYesNo < ActiveRecord::Migration
  def change
  	change_column :bglucoses, :btype, :string
  end
end
