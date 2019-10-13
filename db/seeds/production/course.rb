Course.populate 1 do |course|
  course.name      = "Sistemi Distribuiti e Mobili"
  course.credit    = 6
  course.professor = "Cesare Stefanelli"
end

Course.populate 1 do |course|
  course.name      = "Programmazione Concorrente"
  course.credit    = 6
  course.professor = Faker::Name.name
end

Course.populate 1 do |course|
  course.name      = "Constraint Programming"
  course.credit    = 6
  course.professor = "Marco Gavanelli"
end

Course.populate 1 do |course|
  course.name      = "Ingegneria del Software 2"
  course.credit    = 6
  course.professor = "Evelina Lamma"
end