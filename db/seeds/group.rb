Faker::Number.unique.clear

Group.populate 20 do |group|
  group.name             = Faker::GreekPhilosophers.name
  group.state            = 'public'
  group.message_board_id = Faker::Number.unique.between(1, 20)
end

Group.populate 50 do |group|
  group.name             = Faker::GreekPhilosophers.name
  group.state            = 'private'
  group.message_board_id = Faker::Number.between(1, 20)
end