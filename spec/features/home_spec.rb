require "rails_helper"

RSpec.feature "Home"do
  scenario "has navbar element" do
    visit root_path
    expect(page).to have_css 'nav'
  end
end