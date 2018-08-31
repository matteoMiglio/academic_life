class CreateUsersPostsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users_posts, id: false do |t|
      t.integer :user_id
      t.integer :post_id
    end
  
    add_index :users_posts, :user_id
    add_index :users_posts, :post_id
  end
end
