class CreateImmunizations < ActiveRecord::Migration
  def change
    create_table :immunizations do |t|
      t.string :immunization
      t.date :date
      t.date :expiry
      t.references :phr, index: true

      t.timestamps
    end
  end
  
end
