class CreateCourses < ActiveRecord::Migration[5.2]
  def up
    create_table :courses do |t|
      t.string :name
      t.integer :credit

      t.timestamps
    end
  end

  def down
    drop_table :courses
  end
end
