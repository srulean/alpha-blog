require 'test_helper'

class CreateUsersTest < ActionDispatch::IntegrationTest
  
  test "log in user" do
    get signup_path # get path - from routes
    assert_template 'users/new' # get form
    assert_difference 'User.count', 1 do 
      # provide a value
      post_via_redirect users_path, user: {username: "tester2", email: "tester2@com.com", password: "password", admin: false }
    end
    assert_template 'users/show' # redirect to
    assert_match "tester2", response.body # verify value in response
  end
  
end