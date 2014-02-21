class AddPhrIdToAllergies < ActiveRecord::Migration
  def change
    add_column :allergies, :phr_id, :integer
  end
end
