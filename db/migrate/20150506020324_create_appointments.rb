class CreateAppointments < ActiveRecord::Migration
  def change
    enable_extension 'citext'

    create_table :appointments do |t|
      t.references :user, null: false, index: true
      t.string :status, default: 'pending', null: false, index: true
      t.timestamp :begin_at, null: false, index: true
      t.citext :name, null: false
      t.string :area
      t.string :phone

      t.timestamps null: false
    end
  end
end
