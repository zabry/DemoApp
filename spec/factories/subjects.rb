FactoryBot.define do
  factory :subject do
    name { Faker::Lorem.word }
    classroom { nil }
  end
end
