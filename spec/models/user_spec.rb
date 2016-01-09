require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    it { is_expected.to have_secure_password }
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_uniqueness_of(:username) }

    it { should have_many(:rewards).through(:user_rewards) }
    it { should have_many(:user_rewards) }
  end
end
