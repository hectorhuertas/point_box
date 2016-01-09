class Admin::UsersController < ApplicationController

  def show
    @users = User.all.where(role: 0)
    # byebug
    @usernames = User.all.where(role: 0).pluck(:username, :id)
  end

  def manage_points
    user = User.find(user_params[:user_id])

    new_points = user.points + user_params[:points].to_i
    user.update_attribute(:points, new_points)
    # byebug
    redirect_to admin_user_path(current_user)
  end

  private
    def user_params
      params.require(:point_manager).permit(:points, :user_id)
    end
end