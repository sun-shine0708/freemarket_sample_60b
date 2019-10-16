FactoryBot.define do
  factory :product do
    name {"テスト名前"}
    comment {"テスト説明"}
    price {"3000"}
    status {"未使用に近い"}
    costcharge {"着払い"}
    delivery_way {"未定"}
    delivery_area {"青森県"}
    delivery_date {"2〜3日で発送"}
    category_id {"1"}
  end
end