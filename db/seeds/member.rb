Faker::Number.unique.clear

Member.populate 50 do |member|
  member.membership = 'creator'
  member.user_id    = Faker::Number.between(81, 100)
  member.group_id   = Faker::Number.unique.between(21, 70)
end

Faker::Number.unique.clear

Member.populate 40 do |member|
  member.membership = 'invited'
  member.user_id    = Faker::Number.unique.between(41, 80)
  member.group_id   = Faker::Number.between(21, 30)
end

Member.populate 40 do |member|
  member.membership = 'member'
  member.user_id    = Faker::Number.unique.between(1, 40)
  member.group_id   = Faker::Number.between(31, 70)
end