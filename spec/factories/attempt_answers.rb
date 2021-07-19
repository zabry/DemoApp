FactoryBot.define do
  factory :attempt_answer do
    attempt { nil }
    test_question { nil }
    user_answer { "MyString" }
  end
end
