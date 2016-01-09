require 'rails_helper'

RSpec.describe "user logs out" do
  scenario "they see the login page" do
    user = FactoryGirl.create(:user, password: "pass")

    visit login_path

    fill_in "Username", with: "Peter"
    fill_in "Password", with: "pass"
    click_on "Login"

    click_on "Logout"

    expect(page).to have_content "Goodbye, Peter"
    expect(current_path).to eq login_path
  end
end