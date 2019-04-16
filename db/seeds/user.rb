Faker::Internet.unique.clear
Faker::Number.unique.clear

User.populate 1 do |user|
  user.name               = "Mario"
  user.surname            = "Rossi"
  user.email              = "mario.rossi@example.com"
  user.password_salt      = Authlogic::Random.hex_token
  user.crypted_password   = Authlogic::CryptoProviders::SCrypt.encrypt("password" + user.password_salt)
  user.birthday           = Faker::Date.birthday(18, 65)
  user.address            = Faker::Address.full_address
  user.serial_number      = Faker::Number.unique.number(6)
  user.admin              = 1
  user.login_count        = 0
  user.failed_login_count = 0
end

User.populate 99 do |user|
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