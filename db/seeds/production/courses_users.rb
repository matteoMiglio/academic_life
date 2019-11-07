delete_sql = "DELETE FROM courses_users"
ActiveRecord::Base.connection.execute delete_sql

1.times do

  # Matteo Miglioli
  insert_sql = "INSERT INTO courses_users (user_id, course_id) 
                values (1, 1);"
  ActiveRecord::Base.connection.execute insert_sql 

  insert_sql = "INSERT INTO courses_users (user_id, course_id) 
                values (1, 2);"
  ActiveRecord::Base.connection.execute insert_sql

  insert_sql = "INSERT INTO courses_users (user_id, course_id) 
                values (1, 3);"
  ActiveRecord::Base.connection.execute insert_sql

  insert_sql = "INSERT INTO courses_users (user_id, course_id) 
                values (1, 4);"
  ActiveRecord::Base.connection.execute insert_sql

  # Andrea Fortini
  insert_sql = "INSERT INTO courses_users (user_id, course_id) 
                values (2, 1);"
  ActiveRecord::Base.connection.execute insert_sql 

  insert_sql = "INSERT INTO courses_users (user_id, course_id) 
                values (2, 2);"
  ActiveRecord::Base.connection.execute insert_sql

  insert_sql = "INSERT INTO courses_users (user_id, course_id) 
                values (2, 4);"
  ActiveRecord::Base.connection.execute insert_sql

  # Mattia Fogli
  insert_sql = "INSERT INTO courses_users (user_id, course_id) 
                values (3, 1);"
  ActiveRecord::Base.connection.execute insert_sql 

  insert_sql = "INSERT INTO courses_users (user_id, course_id) 
                values (3, 2);"
  ActiveRecord::Base.connection.execute insert_sql

  insert_sql = "INSERT INTO courses_users (user_id, course_id) 
                values (3, 3);"
  ActiveRecord::Base.connection.execute insert_sql

  insert_sql = "INSERT INTO courses_users (user_id, course_id) 
                values (3, 4);"
  ActiveRecord::Base.connection.execute insert_sql

  # Mauro Tortonesi
  insert_sql = "INSERT INTO courses_users (user_id, course_id) 
                values (4, 1);"
  ActiveRecord::Base.connection.execute insert_sql 

  insert_sql = "INSERT INTO courses_users (user_id, course_id) 
                values (4, 2);"
  ActiveRecord::Base.connection.execute insert_sql

  insert_sql = "INSERT INTO courses_users (user_id, course_id) 
                values (4, 3);"
  ActiveRecord::Base.connection.execute insert_sql

  insert_sql = "INSERT INTO courses_users (user_id, course_id) 
                values (4, 4);"
  ActiveRecord::Base.connection.execute insert_sql

  # Stefano Alvisi
  insert_sql = "INSERT INTO courses_users (user_id, course_id) 
                values (5, 1);"
  ActiveRecord::Base.connection.execute insert_sql 

  insert_sql = "INSERT INTO courses_users (user_id, course_id) 
                values (5, 2);"
  ActiveRecord::Base.connection.execute insert_sql

  insert_sql = "INSERT INTO courses_users (user_id, course_id) 
                values (5, 3);"
  ActiveRecord::Base.connection.execute insert_sql

  insert_sql = "INSERT INTO courses_users (user_id, course_id) 
                values (5, 4);"
  ActiveRecord::Base.connection.execute insert_sql

end