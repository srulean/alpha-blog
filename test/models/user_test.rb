require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.create(username: "test1", email: "test1@test.com", password: "password", admin: false)
  end
  
    test "user should be valid" do
    # Active Record Assertion
    assert @user.valid?
  end
  
  test "username should be present" do
    @user.username = " "
    assert_not @user.valid?
  end
  
  test "username should be unique" do
    @user.save # saves to test DB
    user2 = User.create(username: "test1", email: "test2@test.com", password: "password", admin: false)
    assert_not user2.valid?
  end
  
  test "email should be unique" do
    @user.save # saves to test DB
    user2 = User.create(username: "test2", email: "test1@test.com", password: "password", admin: false)
    assert_not user2.valid?
  end
  
  test "username should not be too long" do
    @user.username = "a" * 26 # one greater than the limit
    assert_not @user.valid?
  end
  
  test "email should not be too long" do
    @user.email = "a" * 94 + "@aa.com"# one greater than the limit
    assert_not @user.valid?
  end
  
  test "username should not be too short" do
    @user.username = "a" * 2 # one less than the limit
    assert_not @user.valid?
  end
  
  test "email should not be too short" do
    @user.email = "a@aaa.aa" # one less than limit
    assert_not @user.valid?
  end
  
end