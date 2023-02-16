FactoryBot.define do
  factory :course, class: 'Course' do
    title {'Math'}
    content {'123'}
    user
  end
end