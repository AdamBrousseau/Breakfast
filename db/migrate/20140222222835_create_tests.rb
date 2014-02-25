class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :name
      t.datetime :date
      t.text :comments
      t.integer :phr_id
      t.attachment :test

      t.timestamps
    end
    add_index :tests, [:phr_id, :date]
  end
end
