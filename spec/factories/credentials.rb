FactoryBot.define do
  #facebook
  factory :credential do
    uid  { Faker::Omniauth.facebook[:uid] }
    provider  { Faker::Omniauth.facebook[:provider] }
  end

  #google
  # factory :credential do
  #   uid  { Faker::Omniauth.google[:uid] }
  #   provider  { Faker::Omniauth.google[:provider] }
  # end
end

