require "rails_helper"

RSpec.feature "destory course" do
  let(:user) { create(:user) }
  let!(:course) { create(:course, user: user) }

  scenario "User destory course" do
    login_as(user)
    page.driver.submit :delete, "/courses/#{course.id}", {}

    expect(page).to have_text 'Math is successfully remove.'
  end

  scenario "Unlogin user destory course" do
    page.driver.submit :delete, "/courses/#{course.id}", {}
    expect(page).to have_text 'You need to sign in or sign up before continuing.'
  end
end