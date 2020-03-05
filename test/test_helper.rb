ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  # Integration with devise
  class ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers
  end

  # Devise code to test sign_in
  # Source: https://medium.com/@yutafujii_59175/a-simple-login-test-with-rails-devise-and-unit-test-68bc4fade4ba
  include Devise::Test::IntegrationHelpers
  include Warden::Test::Helpers

  def log_in( user )
    if integration_test?
      #use warden helper
      login_as(user, :scope => :user)
    else #controller_test, model_test
      #use devise helper
      sign_in(user)
    end  
  end  
  # End of Devise code to test sign_in

end
