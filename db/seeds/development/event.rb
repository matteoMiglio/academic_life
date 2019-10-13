Event.populate 200 do |event|
  event.name        = Faker::Lorem.word
  event.description = Faker::Lorem.sentence
  event.appointment = Faker::Date.forward(45)
  event.place       = Faker::Address.full_address
  event.group_id    = Faker::Number.between(1, 20)
end