require "rails_helper"

RSpec.describe UsersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/users").to route_to("users#index")
    end

    it "routes to #show" do
      expect(:get => "/users/1").to route_to("users#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/users").to route_to("users#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/users/1").to route_to("users#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/users/1").to route_to("users#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/users/1").to route_to("users#destroy", :id => "1")
    end

    it "routes to #regions" do
      expect(:get => "/regions").to route_to("users#regions")
    end

    it "routes to #region" do
      expect(:get => "/region/1").to route_to("users#region", :region_id => "1")
    end

    it "routes to #login" do
      expect(:post => "/users/login").to route_to("users#login")
    end
  end
end
