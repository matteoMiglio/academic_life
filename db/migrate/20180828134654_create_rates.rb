class CreateRates < ActiveRecord::Migration[5.2]
  def up
    create_table :rates do |t|
      t.integer :grade
      t.references :user, foreign_key: true
      t.references :message_board, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :rates
  end
end
