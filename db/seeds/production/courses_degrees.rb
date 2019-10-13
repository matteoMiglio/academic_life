delete_sql = "DELETE FROM courses_degrees"
ActiveRecord::Base.connection.execute delete_sql

1.times do
  insert_sql = "INSERT INTO courses_degrees (course_id, degree_id) 
                values (1, 1)"
  ActiveRecord::Base.connection.execute insert_sql

  insert_sql = "INSERT INTO courses_degrees (course_id, degree_id) 
                values (2, 1)"
  ActiveRecord::Base.connection.execute insert_sql

  insert_sql = "INSERT INTO courses_degrees (course_id, degree_id) 
                values (3, 1)"
  ActiveRecord::Base.connection.execute insert_sql

  insert_sql = "INSERT INTO courses_degrees (course_id, degree_id) 
                values (4, 1)"
  ActiveRecord::Base.connection.execute insert_sql
end