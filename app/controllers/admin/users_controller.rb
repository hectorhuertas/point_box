class Admin::UsersController < Admin::BaseController

  def show
    @users = User.all.where(role: 0)
    # byebug
    @usernames = User.all.where(role: 0).pluck(:username, :id)
  end

  def manage_points
    user = User.find(params[:point_manager][:user_id])

    new_points = user.points + params[:point_manager][:points].to_i
    user.update_attribute(:points, new_points)
    # byebug
    redirect_to admin_user_path(current_user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_user_path(current_user)
    else
      render :new
    end
  end

  private
    # def user_params
    #   params.require(:point_manager).permit(:points, :user_id)
    # end

    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end
end