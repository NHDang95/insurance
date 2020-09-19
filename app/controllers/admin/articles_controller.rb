class Admin::ArticlesController < Admin::ApplicationController
  before_action :get_article, only: [:show, :edit, :update, :destroy]
  def index
  	@articles = Article.paginate(:page => params[:page], :per_page => 5).order(created_at: :desc)
  end

  def show;end

  def new
  	@article = Article.new
  end

  def create
 	@article = Article.new article_params
 	@article.created_at = Time.now
    if @article.save
      flash[:success] = t("create")
      redirect_to new_admin_article_path
    else
      flash[:error] = t("error")
      redirect_to new_admin_article_path
    end
  end

  def edit;end

  def update
    if @article.update_attributes article_params
      flash[:success] = t("updated")
      redirect_to admin_articles_path
    else
      flash[:danger] = t("error")
      render :edit
    end
  end

  def destroy
  	if @article.present?
      @article.destroy
    end
    if @article.destroy
      flash[:success] = t("deleted")
      redirect_to request.referrer || @articles
    else
      flash[:error] = t("error")
      redirect_to @articles
    end
  end

  private
  def get_article
    redirect_to admin_dashboard_path unless @article = Article.find_by(id: params[:id])
  end

  def article_params
  	params.require(:article).permit(:title, :text, :image, :description)
  end
end
