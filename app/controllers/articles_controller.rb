class ArticlesController < ApplicationController
  before_action :get_article, only: :show
  
  def index
  	@articles = Article.distinct.paginate(:page => params[:page], :per_page => 10).order(created_at: :desc)
  end

  def show;end

  private
  def get_article
    redirect_to root_url unless @article = Article.find_by(id: params[:id])
  end

end
