require 'rails_helper'

RSpec.describe "admin creates a user" do
  scenario "they see the user on their dashboard" do
    admin = FactoryGirl.create(:user, password: 'pass', role: 1)
    ApplicationController.any_instance.stub(:current_user).and_return(admin)


    visit admin_user_path(admin)
    # save_and_open_page

    click_on "Create new user"

    fill_in "Username", with: "Aaron"
    fill_in "Password", with: "pass"
    fill_in "Password confirmation", with: "pass"
    click_on "Create user"
    user = User.last

    expect(current_path).to eq admin_user_path(admin)
    expect(page).to have_content "Aaron"
    expect(user.username).to eq "Aaron"
  end

end