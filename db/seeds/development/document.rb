Document.populate 100 do |document|
  document.name             = Faker::Lorem.word
  document.description      = Faker::Lorem.paragraph
  document.user_id          = Faker::Number.between(1, 100)
  document.message_board_id = Faker::Number.between(1, 20)
  document.category_id      = Faker::Number.between(1, 5)
end

Document.all.each do |doc|
  doc.file.attach(io: File.open('./docs/file.pdf'), 
                       filename: doc.name + ".pdf",
                       content_type: 'application/pdf')
end
