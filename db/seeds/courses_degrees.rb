delete_sql = "DELETE FROM courses_degrees"
ActiveRecord::Base.connection.execute delete_sql

500.times do
  insert_sql = "INSERT INTO courses_degrees (course_id, degree_id) 
                values (#{Faker::Number.between(1, 200)}, #{Faker::Number.between(1, 30)})"
  ActiveRecord::Base.connection.execute insert_sql
end