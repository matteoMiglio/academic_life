Faker::Internet.unique.clear
Faker::Number.unique.clear

User.populate 1 do |user|
  user.id = 1
  user.name               = "Matteo"
  user.surname            = "Miglioli"
  user.email              = "matteo.miglioli@academiclife.com"
  user.password_salt      = Authlogic::Random.hex_token
  user.crypted_password   = Authlogic::CryptoProviders::SCrypt.encrypt("password" + user.password_salt)
  user.birthday           = Date.strptime("03/12/1995", "%d/%m/%Y")
  user.address            = Faker::Address.full_address
  
  user.serial_number      = Faker::Number.unique.number(6)
  user.admin              = Faker::Boolean.boolean(1)
  user.login_count        = 0
  user.failed_login_count = 0
end

User.populate 1 do |user|
  user.id = 2
  user.name               = "Andrea"
  user.surname            = "Fortini"
  user.email              = "andrea.fortini@academiclife.com"
  user.password_salt      = Authlogic::Random.hex_token
  user.crypted_password   = Authlogic::CryptoProviders::SCrypt.encrypt("password" + user.password_salt)
  user.birthday           = Date.strptime("20/12/1995", "%d/%m/%Y")
  user.address            = Faker::Address.full_address
  user.serial_number      = Faker::Number.unique.number(6)
  user.admin              = Faker::Boolean.boolean(1)
  user.login_count        = 0
  user.failed_login_count = 0
end

User.populate 1 do |user|
  user.id = 3
  user.name               = "Mattia"
  user.surname            = "Fogli"
  user.email              = "mattia.fogli@academiclife.com"
  user.password_salt      = Authlogic::Random.hex_token
  user.crypted_password   = Authlogic::CryptoProviders::SCrypt.encrypt("password" + user.password_salt)
  user.birthday           = Date.strptime("09/06/1995", "%d/%m/%Y")
  user.address            = Faker::Address.full_address
  user.serial_number      = Faker::Number.unique.number(6)
  user.admin              = Faker::Boolean.boolean(1)
  user.login_count        = 0
  user.failed_login_count = 0
end