require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest
  
  def setup
    # another etst already created a categroy callwed "sports".  if
    # we create another here, it may cause problems with the tests.
    @category = Category.create(name: "sports")
    @category2 = Category.create(name: "dev")
  end  
  
  test "should show categories listing" do
    get categories_path
    assert_template 'categories/index'
    # check for links
    assert_select "a[href=?]", category_path(@category), text: @category.name
    assert_select "a[href=?]", category_path(@category2), text: @category2.name
    
  end
end