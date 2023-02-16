require "rails_helper"

RSpec.feature "destory course" do
  let!(:course) { create(:course) }
  let(:user) { create(:user) }

  scenario "User destory course" do
    login_as(user)
    visit root_path
    click_on 'Remove'

    expect(page).to have_text 'Math is successfully remove.'
  end

  scenario "Unlogin user destory course" do
    page.driver.submit :delete, "/courses/#{course.id}", {}
    expect(page).to have_text 'You need to sign in or sign up before continuing.'
  end
end