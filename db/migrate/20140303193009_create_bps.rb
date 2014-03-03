class CreateBps < ActiveRecord::Migration
  def change
    create_table :bps do |t|
      t.integer :systolic
      t.integer :diastolic
      t.string :condition
      t.integer :phr_id
      t.datetime :date
      t.boolean :deleted, default: false

      t.timestamps
    end
  end
end
