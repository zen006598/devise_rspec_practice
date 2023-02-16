require "rails_helper"

RSpec.feature "destory course"do
  let(:course) { Course.create(title: 'Math', content: '123') }

  scenario "User destory course" do
    visit '/'
    click_on 'remove'

    expect(page).to have_text 'Are you sure?'
    click_on 'yes'
    expect(page).to have_text 'Math is successfully remove.'
  end
end