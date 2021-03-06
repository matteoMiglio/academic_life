class CreateReviews < ActiveRecord::Migration[5.2]
  def up
    create_table :reviews do |t|
      t.string :feedback
      t.references :user, foreign_key: true
      t.references :message_board, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :reviews
  end
end
