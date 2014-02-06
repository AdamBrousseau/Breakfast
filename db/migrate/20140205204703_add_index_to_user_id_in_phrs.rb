class AddIndexToUserIdInPhrs < ActiveRecord::Migration
  def change
    add_index :phrs, :user_id
  end
end
