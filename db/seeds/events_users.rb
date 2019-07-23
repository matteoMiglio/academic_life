delete_sql = "DELETE FROM events_users"
ActiveRecord::Base.connection.execute delete_sql

200.times do
  insert_sql = "INSERT INTO events_users (user_id, event_id) 
                values (#{Faker::Number.between(1, 100)}, #{Faker::Number.between(1, 30)})"
  ActiveRecord::Base.connection.execute insert_sql
end