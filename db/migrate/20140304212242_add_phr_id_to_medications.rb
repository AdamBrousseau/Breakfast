class AddPhrIdToMedications < ActiveRecord::Migration
  def change
      add_column :medications, :phr_id, :integer
  end
end
