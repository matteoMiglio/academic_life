class CreateCoursesUsersJoinTable < ActiveRecord::Migration[5.2]
  def up
    create_table :courses_users, id: false do |t|
      t.integer :course_id
      t.integer :user_id
    end
  
    add_index :courses_users, :course_id
    add_index :courses_users, :user_id
  end

  def down
    drop_table :courses_users
  end
end
