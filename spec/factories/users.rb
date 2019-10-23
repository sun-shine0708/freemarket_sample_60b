FactoryBot.define do
  factory :user, class: User do
    password = Faker::Internet.password(7)
    first_name            { Faker::Name.first_name }
    first_name_kana       {"ヤマダ"}
    nickname              {"taro"}
    email                 { Faker::Internet.email }
    password              { password }
    password_confirmation { password }
    birth_year            { "2016" }
    comment               {"aaaaaaa"}
    phone_number          {"07098706211"}
    last_name             { Faker::Name.last_name }
    last_name_kana        {"タロウ"}
    birth_month           {"12"}
    birth_day             {"19"}
  end

  factory :another_user, class: User do
    password = Faker::Internet.password(7)
    first_name            { Faker::Name.first_name }
    first_name_kana       {"タナカ"}
    nickname              {"hana"}
    email                 { Faker::Internet.email }
    password              { password }
    password_confirmation { password }
    birth_year            { "2000" }
    comment               {"bbbbbb"}
    phone_number          {"08097766211"}
    last_name             { Faker::Name.last_name }
    last_name_kana        {"ハナ"}
    birth_month           {"1"}
    birth_day             {"13"}
  end
end


# FactoryBot.define do

#   factory :user do
#     password = Faker::Internet.password(7)
#     name                  { Faker::Name.name }
#     name_kana             {"ヤマダタロウ"}
#     nickname              {"toro"}
#     email                 { Faker::Internet.free_email }
#     password              { password }
#     password_confirmation { password }
#     birthday              {"1006"}
#     comment               {"aaaaaaa"}
#   end

# end