class ArticlesController < ApplicationController
  def index
    @articles = Article.search(params[:search])
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      flash[:danger] = "Post was not created."
      render 'new'
    end
  end



  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
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
