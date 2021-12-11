require 'rails_helper'

RSpec.describe "Users", type: :request do
  context 'retreive user' do
    let(:password) { Faker::Alphanumeric.alpha(number: 10) }
    let(:user) { create(:user, password: password, password_confirmation: password) }

    describe "GET /users/:id" do
      it "returns user with valid ID" do
        get users_path(id: user.id)

        expect(response).to have_http_status(200)
      end
    end
  end

  context 'create users' do
    let(:region) { create(:region) }
    let(:password) { Faker::Alphanumeric.alpha(number: 10) }
    let(:user_params) do
      {
        user: {
          name: Faker::Name.name,
          email: Faker::Internet.email,
          admin: Faker::Boolean.boolean,
          password: password,
          password_confirmation: password,
          region_id: region.id
        }
      }
    end

    describe "POST /users/" do
      it "returns user with valid ID" do
        post users_path, params: user_params

        expect(response).to have_http_status(201)
      end
    end
  end

  context 'retreive regions' do
    let(:regions) { create_list(:region, 3) }
    let(:region) { regions.first }

    describe "GET /regions/" do
      before do
        allow(Region).to receive(:all).and_return(regions)
        allow(Region).to receive(:find).with(region.id).and_return(region)
      end
      it 'gets all regions' do
        get '/regions'

        expect(response).to have_http_status(200)
        expect(JSON.parse(response.body).count).to eq regions.count
      end
    end
  end
end
