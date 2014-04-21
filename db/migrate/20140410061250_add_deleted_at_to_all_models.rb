class AddDeletedAtToAllModels < ActiveRecord::Migration
  def change
    add_column :users, :deleted_at, :datetime
    
    add_column :ailments, :deleted_at, :datetime
    #remove_column :ailments, :deleted
    
    add_column :allergies, :deleted_at, :datetime
    remove_column :ailments, :deleted
    
    add_column :appointments, :deleted_at, :datetime
    remove_column :appointments, :deleted
    
    add_column :bglucoses, :deleted_at, :datetime
    remove_column :bglucoses, :deleted
    
    add_column :bps, :deleted_at, :datetime
    remove_column :bps, :deleted
    
    add_column :contacts, :deleted_at, :datetime
    remove_column :contacts, :deleted

    add_column :dentals, :deleted_at, :datetime
    remove_column :dentals, :deleted

    add_column :eyes, :deleted_at, :datetime
    remove_column :eyes, :deleted

    add_column :fitnesses, :deleted_at, :datetime
    remove_column :fitnesses, :deleted

    add_column :immunizations, :deleted_at, :datetime
    remove_column :immunizations, :deleted

    add_column :medications, :deleted_at, :datetime
    remove_column :medications, :deleted

    add_column :phrs, :deleted_at, :datetime
    remove_column :phrs, :deleted

    add_column :tests, :deleted_at, :datetime
    remove_column :tests, :deleted
  end
end
