class CreatePhrs < ActiveRecord::Migration
  def change
    create_table :phrs do |t|
      t.string :first_name
      t.string :last_name
      t.datetime :date_of_birth
      t.string :gender
      t.string :blood_type
      t.string :health_card_no

      t.timestamps
    end
  end
end
