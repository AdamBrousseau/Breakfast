class AddReasonColumnToTest < ActiveRecord::Migration
  def change
  	add_column :tests, :reason, :string
  end
end
