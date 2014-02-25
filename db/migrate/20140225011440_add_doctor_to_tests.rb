class AddDoctorToTests < ActiveRecord::Migration
  def change
    add_column :tests, :doctor, :string
  end
end
