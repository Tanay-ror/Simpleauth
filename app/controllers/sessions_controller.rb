class SessionsController < ApplicationController
  before_action :redirect_if_logged_in, only: [:new]

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to redirect_path, notice: 'You Have Logged in successfully!'
    else
      flash.now[:alert] = 'Please enter correct email or password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'User Logged out successfully!'
  end

  private

  def redirect_if_logged_in
    redirect_to posts_path if current_user
  end

  def redirect_path
    posts_path
  end
end
