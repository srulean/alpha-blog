require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  
  def setup
    @category = Category.create(name: "sports")
  end
  
  # test routes
  test "should get categories index" do
    get :index # http command "get"
    assert_response :success
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "should get show" do
    # Unclear why this format
    get(:show, {'id' => @category.id})
    assert_response :success
  end
  
end