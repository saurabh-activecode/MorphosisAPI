FactoryBot.define do
  factory :user, class: User do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    admin { Faker::Boolean.boolean }
    association :region
  end
end