FactoryBot.define do

  factory :user do
    password = Faker::Internet.password(7)
    last_name                  { Faker::Name.name }
    first_name                 { Faker::Name.name }
    first_name_kana            {"ヤマダ"}
    last_name_kana             {"タロウ"}
    nickname                   {"toro"}
    email                      { Faker::Internet.free_email }
    password                   { password }
    password_confirmation      { password }
    birth_year                 {"1999"}
    birth_month                {"12"}
    birth_day                  {"19"}
    phone_number               {"09000000000"}
  end

end