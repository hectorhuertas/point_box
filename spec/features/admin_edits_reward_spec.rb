require 'rails_helper'

RSpec.describe "admin edits reward" do
  scenario "they see the edited rewards index" do
    admin = FactoryGirl.create(:admin, password: 'pass')
    reward = FactoryGirl.create(:reward, name: "Jelly Beans", cost: 20)
    ApplicationController.any_instance.stub(:current_user).and_return(admin)

    visit admin_user_path(admin)
    click_on "View Rewards"

    expect(page).to have_content "Jelly Beans"
    expect(page).to have_content "20"

    within("#reward-#{reward.id}") do
      click_on "Edit Reward"
    end

    fill_in "Name", with: "Jelly Beans!"
    fill_in "Cost", with: 30
    click_on "Update Reward"

    expect(current_path).to eq admin_rewards_path
    expect(page).to have_content "Jelly Beans!"
    expect(page).to have_content "30"
    expect(page).to_not have_content "20"

    within("#reward-#{reward.id}") do
      click_on "Delete Reward"
    end

    expect(page).to_not have_content "Jelly Beans!"
    expect(page).to have_content "Reward deleted"

  end
end