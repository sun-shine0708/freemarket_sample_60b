FactoryBot.define do

  factory :user do
    password = Faker::Internet.password(7)
    name                  { Faker::Name.name }
    name_kana             {"ヤマダタロウ"}
    nickname              {"toro"}
    email                 { Faker::Internet.free_email }
    password              { password }
    password_confirmation { password }
    birthday              {"1006"}
    comment               {"aaaaaaa"}
  end

end