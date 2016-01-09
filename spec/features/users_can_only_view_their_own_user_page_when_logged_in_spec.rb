require 'rails_helper'

RSpec.describe "user logs in" do
  context "they try to access a different user's show page"do
    scenario "they are directed to their own show page" do
      user1 = FactoryGirl.create(:user, password: "pass")
      user2 = FactoryGirl.create(:user, username: "Frank", password: "pass")

      ApplicationController.any_instance.stub(:current_user).and_return(user2)

      visit user_path(user1)

      expect(current_path).to eq user_path(user2)
      expect(page).to have_content "Stay on your own page, bro!"
    end
  end
end