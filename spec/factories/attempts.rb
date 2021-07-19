FactoryBot.define do
  factory :attempt do
    user { nil }
    test_module { nil }
    score { 1.5 }
    started_at { "2021-07-19 16:25:39" }
    completed_at { "2021-07-19 16:25:39" }
  end
end
