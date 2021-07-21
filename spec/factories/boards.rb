FactoryBot.define do
  factory :board do
    name { Faker::Educator.course_name }
  end
end
