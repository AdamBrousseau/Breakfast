class AddCommentsToAilments < ActiveRecord::Migration
  def change
  	add_column :ailments, :comments, :string
  end
end
