require 'rails_helper'

RSpec.describe "user logs in" do
  context "with valid credentials" do
    scenario "they see their dashboard" do

      user = FactoryGirl.create(:user, password: "pass")

      visit login_path

      fill_in "Username", with: "Peter"
      fill_in "Password", with: "pass"
      click_on "Login"

      expect(page).to have_content "Welcome back, Peter"
      expect(page).to have_content "0 points"
      expect(current_path).to eq user_path(user)
    end
  end

  context "with invalid credentials" do
    scenario "login path is re-rendered" do
      user = FactoryGirl.create(:user, password: 'pass')

      visit login_path

      fill_in "Username", with: "Peter"
      fill_in "Password", with: "Peter"
      click_on "Login"


      expect(page).to have_content "Username or password are incorrect"
      expect(page).to_not have_content "Welcome back, Peter"
    end
  end

  context "guest cannot log in" do
    scenario "login path is re-rendered" do
      visit login_path

      fill_in "Username", with: "Peter"
      fill_in "Password", with: "Peter"
      click_on "Login"

      expect(page).to have_content "Username or password are incorrect"
      expect(page).to_not have_content "Welcome back, Peter"
    end
  end
end