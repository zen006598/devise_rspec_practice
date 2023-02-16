require "rails_helper"

RSpec.feature "create course"do
  let(:user) {create(:user)}
  scenario "Log in successfully" do
    user
    visit new_user_session_path

    page.fill_in 'user_email', with: 'user@example.com'
    page.fill_in 'user_password', with: '111111'
    click_button('commit')

    expect(page).to have_text 'user@example.com'
  end

  scenario "Log in failed" do
    user
    visit new_user_session_path

    page.fill_in 'user_email', with: 'user@example.com'
    page.fill_in 'user_password', with: '111'
    click_button('commit')

    expect(page).to have_text 'Invalid Email or password.'
  end

end