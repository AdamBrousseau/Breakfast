class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :phone1
      t.string :phone2
      t.string :email
      t.text   :description
      t.integer:user_id

      t.timestamps
    end
    add_index("contacts", "user_id")
  end
end
