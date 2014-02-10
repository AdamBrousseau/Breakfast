class CreateMedications < ActiveRecord::Migration
  def change
    create_table :medications do |t|
      t.string :medication
      t.string :drug
      t.datetime :begin_date
      t.integer :duration
      t.float :dosage
      t.integer :frequency
      t.string :ailment
      t.string :prescribing_doctor

      t.timestamps
    end
  end
end
