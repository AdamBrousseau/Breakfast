class ChangeAilmentsDateType < ActiveRecord::Migration
  def change
  	change_column :ailments, :begin_date, :date
  	change_column :ailments, :end_date, :date
  end
end
