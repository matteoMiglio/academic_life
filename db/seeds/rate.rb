Rate.populate 100 do |rate|
    rate.grade            = Faker::Number.between(18, 30)
    rate.user_id          = Faker::Number.between(1, 100)
    rate.message_board_id = Faker::Number.between(1, 20)
end