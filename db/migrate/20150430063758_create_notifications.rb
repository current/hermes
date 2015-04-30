class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.timestamp :trigger_at, null: false
      t.string :body, null: false
      t.boolean :done, default: false

      t.timestamps null: false
    end
  end
end
