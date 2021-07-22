FactoryBot.define do
  factory :user do
    name { Faker::Internet.username }
    email { Faker::Internet.email }
    mobile { Faker::Number.number(digits: 3) }
    dob { Faker::Date.in_date_period }
    board_id { nil }
    classroom_id { nil }
    one_time_password { "1111" }
    otp_expires_at { Time.now+5.minutes }
    authentication_token { "f57440dadcba99db0498" }    
  end
end
