class ArticlesController < ApplicationController

  before_action :set_article, only: %i[show edit update destroy]


  def index
    @articles = Article.all
  end

  def show; end

  def new
    @article = Article.new # Needed to instantiate the form_for
  end

  def create
    @article = Article.new(article_params)
    @article.save
    # No need for app/views/restaurants/create.html.erb
    redirect_to root_path
  end

  def edit; end

  def update
    @article.update(article_params)
    # No need for app/views/restaurants/update.html.erb
    redirect_to root_path
  end

  def destroy
    @article.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to root_path, status: :see_other
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end

end
