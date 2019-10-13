Post.populate 100 do |post|
  post.description      = Faker::Lorem.paragraph
  post.user_id          = Faker::Number.between(1, 100)
  post.message_board_id = Faker::Number.between(1, 20)
end