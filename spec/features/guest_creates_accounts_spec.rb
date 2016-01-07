require 'rails_helper'

RSpec.feature "Guest creates an account" do
  scenario "they see their dashboard" do
    visit new_user_path

    fill_in "Username",              with: "Peter"
    fill_in "Password",              with: "pass"
    fill_in "Password confirmation", with: "pass"
    click_on "Register"
    user = User.last
    # save_and_open_page
    expect(page).to have_content "Welcome Peter"
    expect(page).to have_content "0 points"
    expect(current_path).to eq user_path(user)
  end
end
