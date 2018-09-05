delete_sql = "DELETE FROM users_groups"
ActiveRecord::Base.connection.execute delete_sql

500.times do
    insert_sql = "INSERT INTO users_groups (user_id, group_id) 
                  values (#{Faker::Number.between(1, 100)}, #{Faker::Number.between(1, 20)})"
    ActiveRecord::Base.connection.execute insert_sql
end