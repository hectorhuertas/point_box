require 'rails_helper'

RSpec.describe "user logs out" do
  scenario "they see the login page" do
    user = FactoryGirl.create(:user, password: "pass")
    ApplicationController.any_instance.stub(:current_user).and_return(user)

    visit user_path(user)
    click_on "Logout"

    expect(page).to have_content "Goodbye, Peter"
    expect(current_path).to eq login_path

  end
end