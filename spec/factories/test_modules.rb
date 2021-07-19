FactoryBot.define do
  factory :test_module do
    name { "MyString" }
    chapter { nil }
    time_taken { 1.5 }
    no_of_qns { 1 }
  end
end
