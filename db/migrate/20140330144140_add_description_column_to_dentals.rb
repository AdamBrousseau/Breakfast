class AddDescriptionColumnToDentals < ActiveRecord::Migration
  def change
    add_column :dentals, :description, :string
    add_column :dentals, :additional_notes, :string
  end
end
