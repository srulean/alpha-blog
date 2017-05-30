require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  
  def setup
    @category = Category.create(name: "sports")
    @user = User.create(username: "admin1", email: "admin@admin.com", password: "admin", admin: true)
  end
  
  # test routes
  test "should get categories index" do
    get :index # http command "get"
    assert_response :success
  end
  
  test "should get new" do
    session[:user_id] = @user.id
    get :new
    assert_response :success
  end
  
  test "should get show" do
    # Unclear why this format
    get(:show, {'id' => @category.id})
    assert_response :success
  end
  
  test "should redirect create when admin not logged in" do
    # We do NOT have a lgged in user setup.
    assert_no_difference 'Category.count' do
      post :create, category: { name: "sports" }
    end
    assert_redirected_to categories_path
  end
  
end