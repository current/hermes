class CreateMobiles < ActiveRecord::Migration
  def change
    create_table :mobiles do |t|
      t.references :notification, index: true, foreign_key: true
      t.boolean :done, default: false
      t.string :country, null: false
      t.string :area, null: false
      t.string :subscriber, null: false

      t.timestamps null: false
    end
  end
end
