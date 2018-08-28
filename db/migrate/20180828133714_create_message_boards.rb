class CreateMessageBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :message_boards do |t|
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
