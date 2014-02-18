class CreateDentals < ActiveRecord::Migration
  def change
    create_table :dentals do |t|
      t.string :dentist
      t.date :last_cleaning
      t.integer :phr_id

      t.timestamps
    end
  end
end
