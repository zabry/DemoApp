FactoryBot.define do
  factory :test_module do
    name { Faker::Movies::HarryPotter.character }
    chapter_id { nil }
    time_taken { 1.5 }
    no_of_qns { 1 }
  end
end
