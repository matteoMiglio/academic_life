delete_sql = "DELETE FROM users_events"
ActiveRecord::Base.connection.execute delete_sql

500.times do
    insert_sql = "INSERT INTO users_events (user_id, event_id) 
                  values (#{Faker::Number.between(1, 100)}, #{Faker::Number.between(1, 30)})"
    ActiveRecord::Base.connection.execute insert_sql
end