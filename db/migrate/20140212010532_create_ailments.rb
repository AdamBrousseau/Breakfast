class CreateAilments < ActiveRecord::Migration
  def change
    create_table :ailments do |t|
      t.string :ailment_name
      t.datetime :begin_date
      t.datetime :end_date
      t.string :ailment_description
      t.references :phr, index: true

      t.timestamps
    end

    
  end
end
