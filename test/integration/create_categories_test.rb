require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = User.create(username: "admin1", email: "admin@admin.com", password: "admin", admin: true)
  end

  
  test "get new category form and create category" do
    sign_in_as(@user, "admin")
    get new_category_path # get path - from routes
    assert_template 'categories/new' # get form
    assert_difference 'Category.count', 1 do 
      # provide a value
      post_via_redirect categories_path, category: {name: "sports"}
    end
    assert_template 'categories/index' # redirect to
    assert_match "sports", response.body # verify value in response
  end
  
  test "invalid category submission results in failure" do
    sign_in_as(@user, "admin")
    get new_category_path # get path from routes
    assert_template 'categories/new' # get form
    assert_no_difference 'Category.count' do 
      # provide a value
      post categories_path, category: {name: " "}
    end
    
    # assert again page again
    assert_template 'categories/new' # redirect to
    
    # look for the existence of . . .
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
    # These come from views --> shared --> _error.
    # Finding these means an error was found.
  end
  
end