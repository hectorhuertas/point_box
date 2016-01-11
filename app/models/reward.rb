class Reward < ActiveRecord::Base
  has_many :user_rewards, dependent: :destroy
  has_many :users, through: :user_rewards

  validates :name, presence: true, uniqueness: true
  validates :cost, presence: true

  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
end
