class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:info] = "Welcome back, #{user.username}"
      redirect_to current_user
    else
      flash[:error] = "Username or password are incorrect"
      render :new
    end
  end
end