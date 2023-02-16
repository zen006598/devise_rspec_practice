require "rails_helper"

RSpec.feature "Sign up"do
  let(:user) { create(:user) }
  
  before do
    user
    login_as(user)
    visit root_path
  end

  scenario 'Sign out' do
    click_on '登出'
    expect(page).to have_text 'Signed out successfully.'
  end

end