class AddColumnProfessorToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :professor, :string
  end
end
