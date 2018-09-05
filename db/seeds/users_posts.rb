delete_sql = "DELETE FROM users_posts"
ActiveRecord::Base.connection.execute delete_sql

100.times do
    insert_sql = "INSERT INTO users_posts (user_id, post_id) 
                  values (#{Faker::Number.between(1, 100)}, #{Faker::Number.between(1, 100)})"
    ActiveRecord::Base.connection.execute insert_sql
end