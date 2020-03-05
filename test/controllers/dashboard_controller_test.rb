require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  
  # code to test sign_in, 
  # Source: https://medium.com/@yutafujii_59175/a-simple-login-test-with-rails-devise-and-unit-test-68bc4fade4ba
  setup do 
    get '/users/sign_in'
    sign_in users(:one)
    post user_session_url

    follow_redirect!
    assert_response :success
  end

  test 'should get index' do
    get root_path
    assert_response :success
  end
  # end code to test sign_in

end
