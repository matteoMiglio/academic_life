class CreateUsersCoursesJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users_courses, id: false do |t|
      t.integer :user_id
      t.integer :course_id
    end
  
    add_index :users_courses, :user_id
    add_index :users_courses, :course_id
  end
end
