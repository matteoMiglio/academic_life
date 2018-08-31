class CreateUsersGroupsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users_groups, id: false do |t|
      t.integer :user_id
      t.integer :group_id
    end
  
    add_index :users_groups, :user_id
    add_index :users_groups, :group_id
  end
end
