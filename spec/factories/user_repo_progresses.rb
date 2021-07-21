FactoryBot.define do
  factory :user_repo_progress do
    user_id { nil }
    reposoitory_id { nil }
    progress { Faker::Number.number(digits: 2) }
  end
end
