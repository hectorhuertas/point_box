class RewardsController < ApplicationController
  def index
    @rewards = Reward.all
  end
end