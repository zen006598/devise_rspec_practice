require "rails_helper"

RSpec.feature "Sign up"do
  let(:user) { create(:user) }
  scenario 'Sign up successfully' do
    visit new_user_registration_path

    page.fill_in 'user_email', with: 'user@example.com'
    page.fill_in 'user_password', with: '111111'
    page.fill_in 'user_password_confirmation', with: '111111'

    click_on 'Sign up'
    expect(page).to have_text 'user@example.com'
  end

  scenario 'Password is too short' do
    visit new_user_registration_path

    page.fill_in 'user_email', with: 'user@example.com'
    page.fill_in 'user_password', with: '111'
    page.fill_in 'user_password_confirmation', with: '111'

    click_on 'Sign up'
    expect(page).to have_text 'Password is too short'
  end

  scenario 'Email has already been taken' do
    user
    visit new_user_registration_path
    page.fill_in 'user_email', with: "#{user.email}"
    page.fill_in 'user_password', with: '111111'
    page.fill_in 'user_password_confirmation', with: '111111'

    click_on 'Sign up'
    expect(page).to have_text 'Email has already been taken'
  end

end