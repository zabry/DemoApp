FactoryBot.define do
  factory :reposoitory do
    name { Faker::Movies::HarryPotter.character }
    chapter_id { nil }
    filepath { Faker::Movies::HarryPotter.quote }
  end
end
