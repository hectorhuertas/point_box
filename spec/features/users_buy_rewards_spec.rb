require 'rails_helper'

RSpec.describe "user buys reward" do
  scenario "they see it on their dashboard" do
    user = FactoryGirl.create(:user, password: 'pass', points: 100)
    reward = FactoryGirl.create(:reward, name: 'Jelly Beans', cost: 70)
    ApplicationController.any_instance.stub(:current_user).and_return(user)

    visit user_path(user)

    expect(page).to_not have_content "Jelly Beans"

    click_on "Redeem points"

    expect(current_path).to eq rewards_path
    expect(page).to have_content "Jelly Beans"

    within("#reward-#{reward.id}") do
      click_on "Buy"
    end

    expect(page).to have_content "Jelly Beans"
    expect(page).to have_content "30 points"
    expect(user.redeemed_points).to eq 70
  end

  context "they do not have enough points" do
    scenario "they see the rewards page with an error message" do
      user = FactoryGirl.create(:user, password: 'pass', points: 50)
      reward = FactoryGirl.create(:reward, name: 'Jelly Beans', cost: 100)
      ApplicationController.any_instance.stub(:current_user).and_return(user)

      visit rewards_path

      within("#reward-#{reward.id}") do
        click_on "Buy"
      end

      expect(current_path).to eq rewards_path
      expect(page).to have_content "You do not have enough points to buy that"
    end
  end
end