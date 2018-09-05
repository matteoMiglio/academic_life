Faker::File.unique.clear

Category.populate 5 do |category|
    category.name = Faker::File.unique.extension
end