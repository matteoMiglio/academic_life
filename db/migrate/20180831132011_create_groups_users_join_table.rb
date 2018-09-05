class CreateGroupsUsersJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :groups_users, id: false do |t|
      t.integer :group_id
      t.integer :user_id
    end
  
    add_index :groups_users, :group_id
    add_index :groups_users, :user_id
  end
end
