class ArticlesController < ApplicationController
	def index
		@articles = Article.all
		puts "~~~~~~~inside index @articles : #{@articles}"
		Rails.logger.debug("~~~~~~~inside index @articles : #{@articles}")
	end



	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end


	def edit
		
	end

	def create
	  @article = Article.new(article_params)
	 
	  if @article.save
	  	redirect_to @article
	  else
	  	render 'new'
	  end
	end


	def update
		
	end


	def destroy
		
	end

 
	private
	  def article_params
	    params.require(:article).permit(:title, :text)
	  end
end
		