class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome #{@user.username}"
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @rewards = @user.rewards
    if @user != current_user
      flash[:notice] = "Stay on your own page, bro!"
      redirect_to user_path(current_user)
    end
  end

  def buy
    reward = Reward.find(params[:reward_id])
    if user_has_enough_points_to_buy?(reward)
      current_user.rewards << reward
      new_total_available_points = current_user.points - reward.cost
      new_total_redeemed_points = current_user.redeemed_points + reward.cost
      current_user.update_attributes(points: new_total_available_points, redeemed_points: new_total_redeemed_points)
      redirect_to current_user
    else
      flash[:error] = "You do not have enough points to buy that"
      redirect_to rewards_path
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end

    def user_has_enough_points_to_buy?(reward)
      user = current_user
      (user.points - reward.cost) >= 0
    end
end
