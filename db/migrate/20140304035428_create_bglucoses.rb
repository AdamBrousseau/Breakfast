class CreateBglucoses < ActiveRecord::Migration
  def change
    create_table :bglucoses do |t|
      t.float :sugar
      t.datetime :date
      t.string :btype
      t.integer :phr_id
      t.text :comments

      t.timestamps
    end
  end
end
