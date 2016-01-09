class Reward < ActiveRecord::Base
  has_many :user_rewards
  has_many :users, through: :user_rewards

  validates :name, presence: true, uniqueness: true
  validates :cost, presence: true
end
