class PagesController < ApplicationController
  def home
  	render 'home'
  end
  def index
  	@articles = Article.where(:user_id => current_user.id)
	Rails.logger.debug("~~~~~~~inside PagesController @articles : #{@articles}")

  end
end
