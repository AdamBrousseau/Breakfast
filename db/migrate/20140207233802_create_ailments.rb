class CreateAilments < ActiveRecord::Migration
  def change
    create_table :ailments do |t|

      t.timestamps
    end
  end
end
