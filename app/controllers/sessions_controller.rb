class SessionsController < ApplicationController

  def new
    
  end
  
  def create
    user = User.find_by(username: params[:sessin][:username])
    if user && user.authenticate(params[:sessin][:password])
      session[:user_id] = user.id
      flash[:success] = "You have successfully logged in"
      redirect_to root_path
    else
      flash.now[:error] = "Username or password were incorrect"
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "You have successfully logged out"
    redirect_to login_path
  end

end