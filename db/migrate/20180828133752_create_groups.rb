class CreateGroups < ActiveRecord::Migration[5.2]
  def up
    create_table :groups do |t|
      t.string :name
      t.string :state
      t.references :message_board, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :groups
  end
end
