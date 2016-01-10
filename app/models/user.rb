class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true, uniqueness: true
  has_many :user_rewards
  has_many :rewards, through: :user_rewards

  enum role: %w(user admin)
end
