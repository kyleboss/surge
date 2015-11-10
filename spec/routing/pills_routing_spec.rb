require "rails_helper"

RSpec.describe PillsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/pills").to route_to("pills#index")
    end

    it "routes to #new" do
      expect(:get => "/pills/new").to route_to("pills#new")
    end

    it "routes to #show" do
      expect(:get => "/pills/1").to route_to("pills#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/pills/1/edit").to route_to("pills#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/pills").to route_to("pills#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/pills/1").to route_to("pills#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/pills/1").to route_to("pills#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/pills/1").to route_to("pills#destroy", :id => "1")
    end

  end
end
