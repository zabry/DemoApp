FactoryBot.define do
  factory :attempt_answer do
    attempt_id { nil }
    test_question_id { nil }
    user_answer { "choice1" }
  end
end
