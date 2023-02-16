require "rails_helper"

RSpec.feature "destory course" do
  let(:course) { Course.create(title: 'Math', content: '123') }

  scenario "User destory course" do
    course
    visit root_path
    click_on 'Remove'

    expect(page).to have_text 'Math is successfully remove.'
  end
end