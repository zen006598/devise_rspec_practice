require "rails_helper"

RSpec.feature "User login"do
  describe 'when login' do
    let!(:user) {create(:user)}
    before do
      visit new_user_session_path
    end
    scenario "Successed" do
      page.fill_in 'user_email', with: "#{user.email}"
      page.fill_in 'user_password', with: '111111'
      click_button('commit')

      expect(page).to have_text "#{user.email}"
    end

    scenario "Failed" do
      page.fill_in 'user_email', with: "#{user.email}"
      page.fill_in 'user_password', with: '111'
      click_button('commit')

      expect(page).to have_text 'Invalid Email or password.'
    end
  end
end