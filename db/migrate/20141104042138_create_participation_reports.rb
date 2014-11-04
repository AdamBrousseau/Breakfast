class CreateParticipationReports < ActiveRecord::Migration
  def change
    create_table :participation_reports do |t|
      t.string :school_name
      t.integer :school_population
      t.string :principal_name
      t.string :staff_name

      t.integer :no_served_students_breakfast
      t.integer :no_served_students_snack

      t.datetime :reporting_period_start
      t.datetime :reporting_period_end
      t.datetime :program_start_date

      t.integer :no_volunteer_staff
      t.integer :no_volunteer_students
      t.integer :no_volunteer_community
      t.integer :no_volunteer_parents

      t.string :food_donation_source
      t.string :financial_donation_source

      t.integer :user_id

      t.boolean :deleted, :boolean, default: false
      t.timestamps
    end
  end
end
