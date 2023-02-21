class ArticlesController < ApplicationController
  # List
  def index
    @articles = Article.all
  end

  # Detail
  def show
    @article = Article.find(params[:id])
  end

  # Create
  def new
    @article = Article.new
    # Need to instantiate the form_with
  end

  def create
    @article = Article.new(article_params)
    @article.save

    redirect_to article_path(@article)
  end

  # Update
  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    redirect_to article_path(@article)
  end

  # Destroy
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to article_path, status: :see_other
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
