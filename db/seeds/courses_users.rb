delete_sql = "DELETE FROM users_courses"
ActiveRecord::Base.connection.execute delete_sql

300.times do
    insert_sql = "INSERT INTO users_courses (user_id, course_id) 
                  values (#{Faker::Number.between(1, 100)}, #{Faker::Number.between(1, 20)})"
    ActiveRecord::Base.connection.execute insert_sql
end