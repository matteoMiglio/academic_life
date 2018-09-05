Document.populate 100 do |document|
  document.name             = Faker::Lorem.word
  document.description      = Faker::Lorem.paragraph
  document.path             = Faker::File.file_name('path/to')
  document.user_id          = Faker::Number.between(1, 100)
  document.message_board_id = Faker::Number.between(1, 20)
  document.category_id      = Faker::Number.between(1, 5)
end