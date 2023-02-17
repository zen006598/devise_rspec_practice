require "rails_helper"

RSpec.feature "User sign out"do
  describe "when sign out" do
    let!(:user) { create(:user) }
    scenario 'Successed' do
      login_as(user)
      visit root_path
      click_on '登出'
      expect(page).to have_text 'Signed out successfully.'
    end
  end
end