FactoryBot.define do
  factory :user_copy do
    name { Faker::Internet.username }
    email { Faker::Internet.email }
    mobile { Faker::Number.number(digits: 3) }
    dob { Faker::Date.in_date_period }
    board_id { nil }
    classroom_id { nil }
    one_time_password { nil }
    otp_expires_at { nil }
  end
end
