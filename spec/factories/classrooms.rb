FactoryBot.define do
  factory :classroom do
    board_id { nil }
    name { Faker::Educator.degree }
  end
end
