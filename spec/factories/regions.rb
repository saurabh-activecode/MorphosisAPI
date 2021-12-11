FactoryBot.define do
  factory :region, class: Region do
    title { Faker::Name.name }
    tax { Faker::Number.within(range: 1..10) }
    association :country
    association :currency
  end
end