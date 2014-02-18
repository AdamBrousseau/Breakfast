class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :doctor
      t.string :reason
      t.string :results
      t.integer :phr_id

      t.timestamps
    end
  end
end
