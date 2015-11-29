require "rails_helper"

RSpec.describe RfidsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/rfids").to route_to("rfids#index")
    end

    it "routes to #new" do
      expect(:get => "/rfids/new").to route_to("rfids#new")
    end

    it "routes to #show" do
      expect(:get => "/rfids/1").to route_to("rfids#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/rfids/1/edit").to route_to("rfids#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/rfids").to route_to("rfids#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/rfids/1").to route_to("rfids#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/rfids/1").to route_to("rfids#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/rfids/1").to route_to("rfids#destroy", :id => "1")
    end

  end
end
