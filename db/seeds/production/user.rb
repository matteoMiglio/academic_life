Faker::Internet.unique.clear
Faker::Number.unique.clear

User.populate 1 do |user|
  user.name               = "Matteo"
  user.surname            = "Miglioli"
  user.email              = "matteo.miglioli@academiclife.com"
  user.password_salt      = Authlogic::Random.hex_token
  user.crypted_password   = Authlogic::CryptoProviders::SCrypt.encrypt("password" + user.password_salt)
  user.birthday           = Faker::Date.birthday(18, 65)
  user.address            = Faker::Address.full_address
  
  user.serial_number      = Faker::Number.unique.number(6)
  user.admin              = Faker::Boolean.boolean(1)
  user.login_count        = 0
  user.failed_login_count = 0
end

User.populate 1 do |user|
  user.name               = "Andrea"
  user.surname            = "Fortini"
  user.email              = "andrea.fortini@academiclife.com"
  user.password_salt      = Authlogic::Random.hex_token
  user.crypted_password   = Authlogic::CryptoProviders::SCrypt.encrypt("password" + user.password_salt)
  user.birthday           = Faker::Date.birthday(18, 65)
  user.address            = Faker::Address.full_address
  user.serial_number      = Faker::Number.unique.number(6)
  user.admin              = Faker::Boolean.boolean(1)
  user.login_count        = 0
  user.failed_login_count = 0
end

User.populate 1 do |user|
  user.name               = "Mattia"
  user.surname            = "Fogli"
  user.email              = "mattia.fogli@academiclife.com"
  user.password_salt      = Authlogic::Random.hex_token
  user.crypted_password   = Authlogic::CryptoProviders::SCrypt.encrypt("password" + user.password_salt)
  user.birthday           = Faker::Date.birthday(18, 65)
  user.address            = Faker::Address.full_address
  user.serial_number      = Faker::Number.unique.number(6)
  user.admin              = Faker::Boolean.boolean(1)
  user.login_count        = 0
  user.failed_login_count = 0
end