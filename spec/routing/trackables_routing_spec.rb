require "rails_helper"

RSpec.describe TrackablesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/trackables").to route_to("trackables#index")
    end

    it "routes to #new" do
      expect(:get => "/trackables/new").to route_to("trackables#new")
    end

    it "routes to #show" do
      expect(:get => "/trackables/1").to route_to("trackables#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/trackables/1/edit").to route_to("trackables#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/trackables").to route_to("trackables#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/trackables/1").to route_to("trackables#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/trackables/1").to route_to("trackables#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/trackables/1").to route_to("trackables#destroy", :id => "1")
    end

  end
end
