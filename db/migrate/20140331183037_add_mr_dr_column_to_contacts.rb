class AddMrDrColumnToContacts < ActiveRecord::Migration
  def change
  	add_column :contacts, :honorific, :string
  end
end
