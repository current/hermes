class CreateMobiles < ActiveRecord::Migration
  def change
    create_table :mobiles do |t|
      t.references :notification, index: true, foreign_key: true
      t.string :country
      t.string :area
      t.string :subscriber

      t.timestamps null: false
    end
  end
end
