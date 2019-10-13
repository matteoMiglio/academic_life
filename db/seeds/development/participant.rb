Faker::Number.unique.clear

Participant.populate 200 do |participant|
  participant.role = 'creator'
  participant.user_id    = Faker::Number.between(81, 100)
  participant.event_id   = Faker::Number.unique.between(1, 200)
end

Faker::Number.unique.clear

Participant.populate 80 do |participant|
  participant.role = 'member'
  participant.user_id    = Faker::Number.unique.between(1, 80)
  participant.event_id   = Faker::Number.between(1, 200)
end
