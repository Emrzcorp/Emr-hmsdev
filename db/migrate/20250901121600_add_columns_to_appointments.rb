class AddColumnsToAppointments < ActiveRecord::Migration[7.1]
  def change
    add_column :appointments, :status, :string
    add_column :appointments, :notes, :text
  end
end
