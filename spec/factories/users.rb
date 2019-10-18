FactoryBot.define do

  factory :user do
    password = Faker::Internet.password(7)
    first_name            { Faker::Name.first_name }
    first_name_kana       {"ヤマダ"}
    nickname              {"toro"}
    email                 { Faker::Internet.email }
    password              { password }
    password_confirmation { password }
    birth_year            { "2016" }
    phone_number          {"07098706211"}
    last_name             { Faker::Name.last_name }
    last_name_kana        {"タロウ"}
    birth_month           {"12"}
    birth_day             {"19"}
  end

end