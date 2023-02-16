require "rails_helper"

RSpec.feature "edited course"do
  let(:user) { create(:user) }
  let!(:course) { create(:course, user: user) }

  scenario "User made an valid edit to a course" do
    login_as(user)
    visit edit_course_path(course.id)

    expect(page.current_path).to eq edit_course_path(course.id)
    expect(page).to have_text 'Edit Course'

    page.fill_in 'course_content', with: '456'

    click_on 'Update Course'
    expect(page).to have_text 'successfully updated Math'
  end

  scenario "User made an invalid edit to a course" do
    login_as(user)
    visit edit_course_path(course.id)

    expect(page.current_path).to eq edit_course_path(course.id)
    expect(page).to have_text 'Edit Course'

    page.fill_in 'course_title', with: ''

    click_on 'Update Course'
    expect(page).to have_text 'Title can\'t be blank'
  end

  scenario "Unlogin edit course" do
    visit edit_course_path(course.id)
    expect(page).to have_text 'You need to sign in or sign up before continuing.'
  end
end