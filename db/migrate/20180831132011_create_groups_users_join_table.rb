class CreateGroupsUsersJoinTable < ActiveRecord::Migration[5.2]
  def up
    create_table :groups_users, id: false do |t|
      t.integer :group_id
      t.integer :user_id
    end
  
    add_index :groups_users, :group_id
    add_index :groups_users, :user_id
  end

  def down
    drop_table :groups_users
  end
end
