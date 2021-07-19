FactoryBot.define do
  factory :reposoitory do
    name { Faker::Lorem.word }
    chapter { nil }
    filepath { Faker::Lorem.word }
  end
end
