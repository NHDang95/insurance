class StaticPagesController < ApplicationController
  def home
    @articles = Article.all.limit(3).order(created_at: :desc)
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
