Comment.populate 200 do |comment|
    comment.description = Faker::Lorem.sentence
    comment.user_id     = Faker::Number.between(1, 100)
    comment.post_id     = Faker::Number.between(1, 100)
end