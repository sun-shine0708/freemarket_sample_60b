FactoryBot.define do
  factory :product do
    name          {Faker::Name.name}
    comment       {"テスト説明"}
    price         {"3000"}
    status        {"未使用に近い"}
    costcharge    {"着払い"}
    delivery_way  {"未定"}
    delivery_area {"青森県"}
    delivery_date {"2〜3日で発送"}
    # category
    # seller
    # with_images

    # trait :category do
    #   category {"7"}
    # end

    # trait :seller do
    #   seller {"1"}
    # end

    # trait :with_images do
    #   after(:build) do |product|
    #     product.images << FactoryBot.build(:images{ File.open("#{Rails.root}/spec/fixtures/weather_swift.png") })
    #   end
    # end
  end
end