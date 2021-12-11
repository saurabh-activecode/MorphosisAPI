FactoryBot.define do
  factory :currency, class: Currency do
    name { Faker::Currency.name }
    code { Faker::Currency.code }
    association :country
  end
end