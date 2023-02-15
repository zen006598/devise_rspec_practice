require "rails_helper"

RSpec.feature "create course"do
  scenario "User creates a new course" do
    visit '/'
    click_on 'Create Course'
    expect(page.current_path).to eq new_course_path
    expect(page).to have_text 'Create Course'
    
    page.fill_in 'Title', with: 'Math'
    page.fill_in 'Content', with: '123'

    click_on 'Create Course'
    expect(page).to have_text 'successfully created Math'

  end
end