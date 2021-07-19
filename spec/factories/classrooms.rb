FactoryBot.define do
  factory :classroom do
    board_id { nil }
    name { Faker::Lorem.word }
  end
end
