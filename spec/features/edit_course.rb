require "rails_helper"

RSpec.feature "create course"do
  let(:course) { Course.create(title: 'Math', content: '123') }
  scenario "User creates a new course" do
    course
    visit edit_course_path(course.id)

    expect(page.current_path).to eq edit_course_path(course.id)
    expect(page).to have_text 'Edit Course'

    page.fill_in 'course_content', with: '456'

    click_on 'Update Course'
    expect(page).to have_text 'successfully updated Math'
  end
end