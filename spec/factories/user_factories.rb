FactoryBot.define do
  factory :user, class: 'User' do
    email { 'user@example.com' }
    password  { '111111' }
  end
end