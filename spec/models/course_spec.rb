require 'rails_helper'

RSpec.describe Course, type: :model do
  it "is valid with valid attributes" do
    expect(Course.new(title: 'math', content: '123')).to be_valid
  end
end
