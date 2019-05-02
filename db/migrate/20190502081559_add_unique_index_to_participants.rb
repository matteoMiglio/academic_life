class AddUniqueIndexToParticipants < ActiveRecord::Migration[5.2]
  def change
    add_index :participants, ["user_id", "event_id"], unique: true
  end
end
