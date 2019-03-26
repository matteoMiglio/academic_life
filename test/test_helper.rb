ENV['RAILS_ENV'] ||= 'test'

require_relative '../config/environment'
require 'rails/test_help'
require "minitest/reporters"
require "authlogic/test_case"
require "authlogic/test_case"

Minitest::Reporters.use!

class ActiveSupport::TestCase 
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Setup AuthLogic for testing
  setup :activate_authlogic

  def login(user)
    post user_sessions_url, :params => { :user_session => { :email => user.email, 
                                                            :password => 'password' } }
  end

  # Add more helper methods to be used by all tests here...
end
