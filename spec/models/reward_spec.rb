require 'rails_helper'

RSpec.describe Reward, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to validate_presence_of(:cost) }
  
  it { should have_many(:users).through(:user_rewards) }
  it { should have_many(:user_rewards) }
end
