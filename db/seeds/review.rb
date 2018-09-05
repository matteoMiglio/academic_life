Review.populate 100 do |review|
    review.feedback         = Faker::Lorem.paragraph
    review.user_id          = Faker::Number.between(1, 100)
    review.message_board_id = Faker::Number.between(1, 20)
end