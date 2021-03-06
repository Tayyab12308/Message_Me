class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to Message Me #{@user.username}"
      redirect_to root_path(@user)
    else 
      render 'new'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :password)
  end
  
end