Faker::Number.unique.clear

# un creatore per ogni gruppo
Member.populate 50 do |member|
  member.membership = 'creator'
  member.user_id    = Faker::Number.between(1, 100)
  member.group_id   = Faker::Number.unique.between(21, 70)
end

Member.populate 200 do |member|
  member.membership = 'invited'
  member.user_id    = Faker::Number.between(1, 100)
  member.group_id   = Faker::Number.between(21, 70)
end

Member.populate 230 do |member|
  member.membership = 'member'
  member.user_id    = Faker::Number.between(1, 100)
  member.group_id   = Faker::Number.between(21, 70)
end