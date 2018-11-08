Course.populate 50 do |course|
  course.name      = Faker::Educator.course_name
  course.credit    = [3, 6, 9, 12]
  course.professor = Faker::Name.name
end