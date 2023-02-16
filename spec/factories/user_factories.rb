FactoryBot.define do
  factory :user, class: 'User' do
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password  { '111111' }
  end
end