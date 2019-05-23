class CreateParticipants < ActiveRecord::Migration[5.2]
  def up
    create_table :participants do |t|
      t.string :role
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :participants
  end
end
