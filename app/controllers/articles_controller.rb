class ArticlesController < ApplicationController
	
	# http_basic_authenticate_with name: "dhh", password: "secret",
	# except: [:index, :show]
	before_action :authenticate_user! 

	def index
		@articles = Article.all
		Rails.logger.debug("~~~~~~~inside index @articles : #{@articles}")
	end



	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new()
	
	end


	def edit
		@article = Article.find(params[:id])
	end

	def create
	  @article = Article.new(article_params)
		Rails.logger.debug("~~~~~~~inside before  @article : #{ @article}")

	  @article.user_id = current_user.id
		Rails.logger.debug("~~~~~~~inside after  @article : #{ @article}")

	 
	  if @article.save
	  	redirect_to @article
	  else
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
	  @article = Article.find(params[:id])
	  @article.destroy
	 
	  redirect_to articles_path
	end

	def mydashboard
		if user_signed_in?
			loggedinUserId = current_user.id
			@articles = Article.where(user_id: loggedinUserId)
		end
		render 'dashboard'
	end

 
	private
	  def article_params
	    params.require(:article).permit(:title, :text)
	  end
end
		