class Admin::RewardsController < Admin::BaseController
  def index
    @rewards = Reward.all
  end

  def new
    @reward = Reward.new
  end

  def create
    @reward = Reward.new(reward_params)
    if @reward.save
      redirect_to admin_rewards_path
    end
  end

  def edit
    @reward = Reward.find(params[:id])
  end

  def update
    @reward = Reward.find(params[:id])
    if @reward.update_attributes(reward_params)
      flash[:success] = "Reward updated"
      redirect_to admin_rewards_path
    else
      render 'edit'
    end
  end

  def destroy
    Reward.find(params[:id]).destroy
    flash.now[:notice] = "Reward deleted"
    render 'index'
  end

  private
    def reward_params
      params.require(:reward).permit(:name, :cost, :picture)
    end
end