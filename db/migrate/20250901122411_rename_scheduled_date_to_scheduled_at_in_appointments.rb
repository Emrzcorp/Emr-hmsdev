class RenameScheduledDateToScheduledAtInAppointments < ActiveRecord::Migration[7.1]
  def change
    rename_column :appointments, :scheduled_date, :scheduled_at
  end
end
