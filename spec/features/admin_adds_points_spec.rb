require 'rails_helper'

RSpec.describe "admin add points to user" do
  scenario "admin sees user with added points" do
    admin = FactoryGirl.create(:user, password: 'pass', role: 1)
    user = FactoryGirl.create(:user, password: 'pass')
    ApplicationController.any_instance.stub(:current_user).and_return(admin)

    visit admin_user_path(admin)
    expect(page).to have_content user.username
    expect(page).to have_content "0 points"
    expect(page).to have_content "0 redeemed points"
    # save_and_open_page
    fill_in "Points", with: 14
    select "Peter", from: 'point_manager[user_id]'
    click_on "Modify Points"

    expect(page).to have_content user.username
    expect(page).to have_content "14 points"
    #use within to target proper user
  end
end