FactoryBot.define do
  factory :chapter do
    name { Faker::Lorem.word }
    subject { nil }
  end
end
