FactoryBot.define do
  factory :chapter do
    name { Faker::Educator.secondary_school }
    subject { nil }
  end
end
