Degree.populate 30 do |degree|
  degree.name          = Faker::Educator.degree
  degree.department_id = Faker::Number.between(1, 10)
end