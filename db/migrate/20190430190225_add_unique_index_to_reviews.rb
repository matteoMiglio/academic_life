class AddUniqueIndexToReviews < ActiveRecord::Migration[5.2]
  def change
    add_index :reviews, ["user_id", "message_board_id"], unique: true
  end
end
