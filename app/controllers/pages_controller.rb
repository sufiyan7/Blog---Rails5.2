class PagesController < ApplicationController
  def home
  	render 'home'
  end
  def dashboard
  	@articles = Article.where(:user_id => current_user.id)
	Rails.logger.debug("~~~~~~~inside PagesController @articles : #{@articles}")

  end
end
