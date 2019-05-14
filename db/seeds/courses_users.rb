delete_sql = "DELETE FROM courses_users"
ActiveRecord::Base.connection.execute delete_sql

# 1.times do
#   insert_sql = "INSERT INTO courses_users (user_id, course_id) 
#                 values (1, 3);"
#   ActiveRecord::Base.connection.execute insert_sql 

#   insert_sql = "INSERT INTO courses_users (user_id, course_id) 
#                 values (2, 3);"
#   ActiveRecord::Base.connection.execute insert_sql
# end

300.times do
  insert_sql = "INSERT INTO courses_users (user_id, course_id) 
                values (#{Faker::Number.between(1, 100)}, #{Faker::Number.between(1, 20)})"
  ActiveRecord::Base.connection.execute insert_sql
end