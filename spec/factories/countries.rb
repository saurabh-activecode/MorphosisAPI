FactoryBot.define do
  factory :country, class: Country do
    name { Faker::Address.country }
    code { Faker::Address.country_code }
  end
end