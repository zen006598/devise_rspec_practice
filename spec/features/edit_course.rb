require "rails_helper"

RSpec.feature "edited course"do

  let(:course) { Course.create(title: 'Math', content: '123') }

  scenario "User made an valid edit to a course" do
    course
    visit edit_course_path(course.id)

    expect(page.current_path).to eq edit_course_path(course.id)
    expect(page).to have_text 'Edit Course'

    page.fill_in 'course_content', with: '456'

    click_on 'Update Course'
    expect(page).to have_text 'successfully updated Math'
  end

  scenario "User made an invalid edit to a course" do
    course
    visit edit_course_path(course.id)

    expect(page.current_path).to eq edit_course_path(course.id)
    expect(page).to have_text 'Edit Course'

    page.fill_in 'course_title', with: ''

    click_on 'Update Course'
    expect(page).to have_text 'Title can\'t be blank'
  end
end