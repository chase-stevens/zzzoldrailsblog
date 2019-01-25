class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to @article
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end

  def destroy
    Article.find(params[:id]).destroy
    flash[:success] = "Article deleted"
    redirect_to articles_params
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
