class AddUuidToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :uuid, :uuid, unique: true, null: false
  end
end
