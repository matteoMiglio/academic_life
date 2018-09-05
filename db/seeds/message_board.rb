Faker::Number.unique.clear

MessageBoard.populate 20 do |message_board|
    message_board.course_id = Faker::Number.unique.between(1, 20)
end