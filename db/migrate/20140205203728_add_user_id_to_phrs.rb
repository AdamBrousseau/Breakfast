class AddUserIdToPhrs < ActiveRecord::Migration
  def change
    add_column :phrs, :user_id, :int
  end
end
