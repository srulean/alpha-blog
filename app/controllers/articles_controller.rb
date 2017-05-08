class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all
  end
  
  def new
    # Need to send in an Article object
    @article = Article.new
  end
  
  def edit
    # Need to send in an Article object
    @article = Article.find(params[:id])
  end
  
  def create
    # Used by the new funciotn above.
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was successfully created."
      redirect_to article_path(@article)
    else
      #flash[:notice] = "Article was NOT successfully created."
      render 'new'
    end
  end
  
  def update
    # Used by the edit funciotn above.
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated."
      redirect_to article_path(@article)
    else
      #flash[:notice] = "Article was NOT successfully created."
      render 'edit'
    end
  end
  
  def show 
    @article = Article.find(params[:id])
  end
  
  private 
    def article_params
      params.require(:article).permit(:title, :description)
    end
  
end