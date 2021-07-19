FactoryBot.define do
  factory :test_question do
    test_module { nil }
    question { "MyString" }
    choice1 { "MyString" }
    choice2 { "MyString" }
    choice3 { "MyString" }
    choice4 { "MyString" }
    answer { "MyString" }
  end
end
