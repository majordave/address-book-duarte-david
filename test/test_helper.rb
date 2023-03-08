ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors, with: :threads)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  module SignInHelper
    def sign_in_helper
      passwordString = "ORIGINAL PASSWORD"
      password = BCrypt::Password.create(passwordString)
      
      user = User.new
      user.username = "myUser"
      user.password_digest = password
      user.save
      
      post '/login', params: {username: user.username, password: passwordString}
    end
  end

  class ActionDispatch::IntegrationTest
    include SignInHelper
  end
  
end
