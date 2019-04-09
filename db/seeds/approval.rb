Approval.populate 1000 do |approval|
  approval.user_id     = Faker::Number.between(1, 100)
  approval.post_id     = Faker::Number.between(1, 100)
end