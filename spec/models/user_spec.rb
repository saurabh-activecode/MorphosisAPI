require "rails_helper"

RSpec.describe User, type: :model do
  let(:region) { create(:region) }
  let(:password) { Faker::Alphanumeric.alpha(number: 10) }
  let(:user) { create(:user, password: password, password_confirmation: password) }
  
  it 'is valid with valid attributes' do
    new_user = create(
      :user,
      name: Faker::Name.name,
      email: Faker::Internet.email,
      admin: Faker::Boolean.boolean,
      password: password,
      password_confirmation: password,
      region: region
    )
    expect(new_user).to be_valid
  end

  it 'is invalid with invalid attributes' do
    new_user = build(
      :user,
      name: Faker::Name.name,
      email: Faker::Internet.email,
      admin: Faker::Boolean.boolean,
      password: password,
      password_confirmation: '',
      region: region
    )
    expect(new_user).not_to be_valid
  end
end