Faker::Internet.unique.clear
Faker::Number.unique.clear

User.populate 100 do |user|
    user.name               = Faker::Name.first_name
    user.surname            = Faker::Name.last_name
    user.email              = Faker::Internet.unique.email
    user.crypted_password   = Faker::Internet.password(10, 20, true, true)
    user.password_salt      = Faker::Internet.password(10, 20, true, true)
    user.birthday           = Faker::Date.birthday(18, 65)
    user.address            = Faker::Address.full_address
    user.serial_number      = Faker::Number.unique.number(6)
    user.admin              = Faker::Boolean.boolean(0.1)
    user.login_count        = 0
    user.failed_login_count = 0
end