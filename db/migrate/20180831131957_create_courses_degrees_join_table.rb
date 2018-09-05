class CreateCoursesDegreesJoinTable < ActiveRecord::Migration[5.2]
  def up
    create_table :courses_degrees, id: false do |t|
      t.integer :course_id
      t.integer :degree_id
    end
  
    add_index :courses_degrees, :course_id
    add_index :courses_degrees, :degree_id
  end

  def down
    drop_table :courses_degrees
  end
end
