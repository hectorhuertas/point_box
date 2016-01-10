class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:info] = "Welcome back, #{user.username}"
      if current_user.admin?
        redirect_to admin_user_path(current_user)
      else
        redirect_to current_user
      end
    else
      flash[:error] = "Username or password are incorrect"
      render :new
    end
  end

  def destroy
    user = current_user
    session.clear
    flash[:notice] = "Goodbye, #{user.username}"
    redirect_to login_path
  end
end