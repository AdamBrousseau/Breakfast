class CreateAllergies < ActiveRecord::Migration
  def change
    create_table :allergies do |t|
      t.string :allergy_name
      t.string :allergy_description

      t.timestamps
    end
  end
end
