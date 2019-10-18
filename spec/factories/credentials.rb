FactoryBot.define do

  factory :credential do
    uid  { Faker::Omniauth.facebook[:uid] }
    provider  { Faker::Omniauth.facebook[:provider] }
  end

  factory :credential do
    uid  { Faker::Omniauth.google[:uid] }
    provider  { Faker::Omniauth.google[:provider] }
  end

end

