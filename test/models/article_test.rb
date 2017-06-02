require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  
  def setup
    @user = User.create(username: "test1", email: "test@test.com", password: "password", admin: false)
    @article = Article.new(title: "test title", description: "test description", user: @user)
  end
  
  test "article should be valid" do
    # Active Record Assertion
    assert @article.valid?
  end
  
  test "title should be present" do
    @article.title = " "
    assert_not @article.valid?
  end
  
  test "title should be unique" do
    @article.save # saves to test DB
    article2 = Article.new(title: "title2", description: "desc 2")
    assert_not article2.valid?
  end
  
  test "title should not be too long" do
    @article.title = "a" * 51 # one greater than the limit
    assert_not @article.valid?
  end
  
  test "Description should not be too long" do
    @article.title = "a" * 301 # one greater than the limit
    assert_not @article.valid?
  end
  
  test "title should not be too short" do
    @article.title = "a" * 2 # one less than the limit
    assert_not @article.valid?
  end
  
end