require "rails_helper"

RSpec.feature "create course"do
  scenario "User creates a valid course" do
    visit '/'
    click_on 'Create Course'
    expect(page.current_path).to eq new_course_path
    expect(page).to have_text 'Create Course'

    page.fill_in 'course_title', with: 'Math'
    page.fill_in 'course_content', with: '123'

    click_on 'Create Course'
    expect(page).to have_text 'successfully created Math'

  end

  scenario "User creates a invalid course" do
    visit '/'
    click_on 'Create Course'
    expect(page.current_path).to eq new_course_path
    expect(page).to have_text 'Create Course'

    page.fill_in 'course_content', with: '123'

    click_on 'Create Course'
    expect(page).to have_text 'Title can\'t be blank'

  end
end