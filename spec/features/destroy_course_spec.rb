require "rails_helper"

RSpec.feature "Destroying course" do

  describe 'when destroying course' do
    let(:user) { create(:user) }
    let!(:course) { create(:course, user: user) }
  
    scenario "Successed" do
      login_as(user)
      page.driver.submit :delete, "/courses/#{course.id}", {}
  
      expect(page).to have_text 'Math is successfully remove.'
    end
  
    scenario "Without login" do
      page.driver.submit :delete, "/courses/#{course.id}", {}
      expect(page).to have_text 'You need to sign in or sign up before continuing.'
    end
  end
end