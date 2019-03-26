ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!
require "authlogic/test_case"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  setup :activate_authlogic
  # Add more helper methods to be used by all tests here...

  def login(user)
    post user_sessions_url, :params => { :user_session => { :email => user.email, :password => 'password' } }
  end
end
