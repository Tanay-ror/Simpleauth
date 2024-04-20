class UsersController < ApplicationController
  before_action :redirect_if_logged_in, only: [:new]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.password == params[:user][:password_confirmation]
      if @user.save
        session[:user_id] = @user.id
        redirect_to posts_path, notice: 'User successfully created!'
      else
        flash.now[:alert] = 'Unable to create user. Please correct the errors below.'
        render :new
      end
    else
      @user.errors.add(:password_confirmation, "Password confirmation doesn't match Password")
      flash.now[:alert] = 'Unable to create user. Please correct the errors below.'
      render :new
    end
  end

  private

  def redirect_if_logged_in
    redirect_to posts_path, notice: 'You are already logged in.' if current_user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
