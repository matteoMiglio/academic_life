class CreateNotifications < ActiveRecord::Migration[5.2]
  def up
    create_table :notifications do |t|
      t.integer :recipient_id
      t.integer :actor_id
      t.datetime :read_at
      t.string :action
      t.integer :notifiable_id
      t.string :notifiable_type

      t.timestamps
    end
  end

  def down
    drop_table :notifications
  end
end
