class ChangeDentalColumnLastvisitToDate < ActiveRecord::Migration
  def change
  	rename_column :dentals, :last_visit, :date
  end
end
