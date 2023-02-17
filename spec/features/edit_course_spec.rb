require "rails_helper"

RSpec.feature "Edited course"do
  let!(:user) { create(:user) }
  let!(:course) { create(:course, user: user) }

  describe 'When logged in' do

    before do
      login_as(user)
      visit edit_course_path(course.id)
    end

    scenario 'when get the course' do
      expect(page.current_path).to eq edit_course_path(course.id)
      expect(page).to have_text 'Edit Course'
    end
    
    scenario 'Successed' do
      page.fill_in 'course_content', with: '456'
  
      click_on 'Update Course'

      expect(page).to have_text 'successfully updated Math'
    end
  
    scenario "Failed" do
      page.fill_in 'course_title', with: ''
  
      click_on 'Update Course'

      expect(page).to have_text 'Title can\'t be blank'
    end
  end
  
  describe 'without log in' do
    scenario "Can't edit" do
      visit edit_course_path(course.id)
      expect(page).to have_text 'You need to sign in or sign up before continuing.'
    end
  end

end