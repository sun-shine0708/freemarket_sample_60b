FactoryBot.define do
  factory :streetaddress do
    last_name        {Faker::Name.last_name}
    first_name       {Faker::Name.first_name}
    last_name_kana   {"ヤマダ"}
    first_name_kana  {"タロウ"}
    post_number      {"100-0005"}
    prefecture       {1}
    city             {"千代田区"}
    address          {"丸の内２丁目７−３"}
    building_name    {"東京ビル"}
    phone_number     {"09012345678"}
    user
  end
end