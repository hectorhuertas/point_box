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

  private
    def reward_params
      params.require(:reward).permit(:name, :cost)
    end
end