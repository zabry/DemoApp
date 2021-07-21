FactoryBot.define do
  factory :subject do
    name { Faker::Educator.subject }
    classroom { nil }
  end
end
