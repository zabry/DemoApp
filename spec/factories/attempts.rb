FactoryBot.define do
  factory :attempt do
    user_id { nil }
    test_module_id { nil }
    score { 1.5 }
    started_at { "2021-07-19 16:25:39" }
    completed_at { "2021-07-19 16:25:39" }
  end
end
