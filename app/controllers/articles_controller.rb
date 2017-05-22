class ArticlesController < ApplicationController
  # ORDER MATTERS! for before_actions.
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def index
    @articles = Article.paginate(page: params[:page], per_page: 4)
  end
  
  def new
    # Need to send in an Article object
    @article = Article.new
  end
  
  def edit
    # Need to send in an Article object
    # Took this out due to the before_action clause above.
    # @article = Article.find(params[:id])
  end
  
  def create
    # Used by the new funciotn above.
    @article = Article.new(article_params)
    # temporarily provide default user
    @article.user = User.first
    
    if @article.save
      flash[:success] = "Article was successfully created."
      redirect_to article_path(@article)
    else
      #flash[:notice] = "Article was NOT successfully created."
      render 'new'
    end
  end
  
  def update
    # Used by the edit funciotn above.
    
    # Took this out due to the before_action clause above.
    # @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] = "Article was successfully updated."
      redirect_to article_path(@article)
    else
      #flash[:notice] = "Article was NOT successfully created."
      render 'edit'
    end
  end
  
  def show
    # Took this out due to the before_action clause above.
    # @article = Article.find(params[:id])
  end
  
  def destroy
    # Took this out due to the before_action clause above.
    # @article = Article.find(params[:id])
    @article.destroy
    
    flash[:danger] = "Article was deleted!"
    redirect_to articles_path
  end
  
  private 
    def set_article
      @article = Article.find(params[:id])
    end
    def article_params
      params.require(:article).permit(:title, :description)
    end
  
end