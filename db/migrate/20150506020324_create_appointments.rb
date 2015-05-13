class CreateAppointments < ActiveRecord::Migration
  def change
    enable_extension 'citext'

    create_table :appointments do |t|
      t.citext :name, null: false
      t.boolean :notified, default: false
      t.timestamp :begin_at, null: false, index: true
      t.string :area
      t.string :phone

      t.timestamps null: false
    end
  end
end
