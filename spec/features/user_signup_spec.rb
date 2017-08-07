require 'rails_helper'

describe "the signin process", :type => :feature do


  it "signs me in" do
    visit '/users/new'
    within("#new_user") do
      fill_in 'Name', with: 'user1'
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
      fill_in 'Confirmation', with: 'password'

    end
    click_button 'Create my account'
    expect(page).to have_content "You're logged in as"
  end
end
