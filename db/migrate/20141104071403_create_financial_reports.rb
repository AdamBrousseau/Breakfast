class CreateFinancialReports < ActiveRecord::Migration
  def change
    create_table :financial_reports do |t|
      t.string :school_name
      t.datetime :month_of_report
      t.decimal :total_spent
      t.string :comments

      t.integer :user_id

      t.boolean :deleted, :boolean, default: false
      t.timestamps
    end
  end
end
