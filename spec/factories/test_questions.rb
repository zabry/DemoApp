FactoryBot.define do
  factory :test_question do
    test_module_id { nil }
    question { Faker::Company.name }
    choice1 { Faker::Science.scientist }
    choice2 { Faker::Science.scientist }
    choice3 { Faker::Science.scientist }
    choice4 { Faker::Science.scientist }
    answer { "choice1" }
  end
end
