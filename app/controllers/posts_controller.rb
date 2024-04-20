class PostsController < ApplicationController
  before_action :require_login

  def index
    @posts = current_user.posts.page(params[:page]).per(10)
  end

  private

  def require_login
    unless current_user
      store_location
      redirect_to login_path, alert: 'Please Login to access this section'
    end
  end

  def store_location
    session[:return_to] = request.original_url if request.get?
  end
end
