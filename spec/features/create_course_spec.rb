require "rails_helper"

RSpec.feature "Create course"do
  describe 'When create course' do
    context 'User logged in' do
      let!(:user) { create(:user) }
       before do
        login_as(user)
        visit root_path
        click_on 'Create Course'
        expect(page.current_path).to eq new_course_path
        expect(page).to have_text 'Create Course'
       end

      scenario "Successed" do
        page.fill_in 'course_title', with: 'Math'
        page.fill_in 'course_content', with: '123'
    
        click_on 'Create Course'
        expect(page).to have_text 'successfully created Math'
    
      end
    
      scenario "Failed" do
        page.fill_in 'course_content', with: '123'
    
        click_on 'Create Course'
        expect(page).to have_text 'Title can\'t be blank'
      end
    end
    
    context 'User without login' do
      scenario "Can't create" do
        visit root_path
        click_on 'Create Course'
        expect(page).to have_text 'You need to sign in or sign up before continuing.'
      end
    end
  end
end