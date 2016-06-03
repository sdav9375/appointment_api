class ChangeColumnsOnAppointments < ActiveRecord::Migration
  def change
    remove_column :appointments, :date, :date
    remove_column :appointments, :start_time, :time
    remove_column :appointments, :end_time, :time
    add_column :appointments, :start_time, :datetime
    add_column :appointments, :end_time, :datetime
  end
end
