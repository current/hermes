class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.citext :email
      t.string :name
      t.string :password_digest
      t.string :business
      t.string :time_zone

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
  end
end
