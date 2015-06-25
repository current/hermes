class AddUserIdToAppointments < ActiveRecord::Migration
  def change
    change_table :appointments do |t|
      t.references :user, index: true, null: false
    end
  end
end
