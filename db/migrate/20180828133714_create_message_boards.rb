class CreateMessageBoards < ActiveRecord::Migration[5.2]
  def up
    create_table :message_boards do |t|
      t.references :course, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :message_boards
  end
end
