require "rails_helper"

RSpec.feature "create course"do
  let(:user) { create(:user) }
  
  scenario "User creates a valid course" do
    login_as(user)
    visit root_path
    click_on 'Create Course'
    expect(page.current_path).to eq new_course_path
    expect(page).to have_text 'Create Course'

    page.fill_in 'course_title', with: 'Math'
    page.fill_in 'course_content', with: '123'

    click_on 'Create Course'
    expect(page).to have_text 'successfully created Math'

  end

  scenario "User creates a invalid course" do
    login_as(user)
    visit root_path
    click_on 'Create Course'
    expect(page.current_path).to eq new_course_path
    expect(page).to have_text 'Create Course'

    page.fill_in 'course_content', with: '123'

    click_on 'Create Course'
    expect(page).to have_text 'Title can\'t be blank'
  end

  scenario "Unlogin create course" do
    visit root_path
    click_on 'Create Course'
    expect(page).to have_text 'You need to sign in or sign up before continuing.'
  end
end