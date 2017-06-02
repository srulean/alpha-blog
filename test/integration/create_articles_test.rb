require 'test_helper'

class CreateArticlesTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = User.create(username: "tester1", email: "tester1@com.com", password: "password", admin: false)
  end
  
  test "get new article form and create article" do
    sign_in_as(@user, "password")
    get new_article_path # get path - from routes
    assert_template 'articles/new' # get form
    assert_difference 'Article.count', 1 do 
      # provide a value
      post_via_redirect articles_path, article: {title: "int test title", description: "int test desc" }
    end
    assert_template 'articles/show' # redirect to
    # assert_match "sports", response.body # verify value in response
    assert_match "int test title", response.body # verify value in response
    assert_match "int test desc", response.body # verify value in response
  end
  
end