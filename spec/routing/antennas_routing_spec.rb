require "rails_helper"

RSpec.describe AntennasController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/antennas").to route_to("antennas#index")
    end

    it "routes to #new" do
      expect(:get => "/antennas/new").to route_to("antennas#new")
    end

    it "routes to #show" do
      expect(:get => "/antennas/1").to route_to("antennas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/antennas/1/edit").to route_to("antennas#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/antennas").to route_to("antennas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/antennas/1").to route_to("antennas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/antennas/1").to route_to("antennas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/antennas/1").to route_to("antennas#destroy", :id => "1")
    end

  end
end
