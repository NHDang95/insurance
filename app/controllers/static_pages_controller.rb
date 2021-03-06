class StaticPagesController < ApplicationController
  def home
    @articles = Article.all.limit(9).order(created_at: :desc)
    @products = Product.where(parent_id: 3)
  end
  
  def show
  	if valid_page?
    	render template: "static_pages/#{params[:page]}"
    else
    	render file: "public/404.html", status: :not_found
    end
  end

  private
  	def valid_page?
      File.exist?(Pathname.new(Rails.root + "app/views/static_pages/#{params[:page]}.html.erb"))
    end
end
