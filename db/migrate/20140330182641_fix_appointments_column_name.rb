class FixAppointmentsColumnName < ActiveRecord::Migration
  def change
    rename_column :appointments, :created_at, :appointment_date
  end
end
