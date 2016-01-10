require 'rails_helper'

RSpec.describe "Admin creates reward" do
  scenario "they see the reward in the rewards index" do
    admin = FactoryGirl.create(:user, role: 1, password: 'pass')
    ApplicationController.any_instance.stub(:current_user).and_return(admin)

    visit admin_rewards_path
    click_on "New Reward"
    fill_in "Name", with: "Jelly Beans"
    fill_in "Cost", with: "99"
    click_on "Create Reward"

    reward = Reward.last

    # save_and_open_page
    expect(current_path).to eq admin_rewards_path
    # byebug
    within("#reward-#{reward.id}") do
      expect(page).to have_content "Jelly Beans"
      expect(page).to have_content "99"
    end
  end
end