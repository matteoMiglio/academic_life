class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.date :birthday
      t.string :address
      t.string :serial_number
      t.boolean :admin

      t.timestamps
    end
  end
end
