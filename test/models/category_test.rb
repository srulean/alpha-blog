require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  
  def setup
    @category = Category.new(name: "sports")
  end
  
  test "category should be valid" do
    # Active Record Assertion
    assert @category.valid?
  end
  
  test "name should be present" do
    @category.name = " "
    assert_not @category.valid?
  end
  
  test "name should be unique" do
    @category.save # saves to test DB
    category2 = Category.new(name: "sports") # Because we used this above already
    assert_not category2.valid?
  end
  
  test "name should not be too long" do
    @category.name = "a" * 26 # one greater than the limit
    assert_not @category.valid?
  end
  
  test "name should not be too short" do
    @category.name = "a" * 2 # one less than the limit
    assert_not @category.valid?
  end
  
end