class AddFewColumnsToEyes < ActiveRecord::Migration
  def change
  	  	add_column :eyes, :comment2, :string
  	  	add_column :eyes, :doctor, :string
  end
end
