require "rails_helper"

RSpec.describe InventorySnapshotsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/inventory_snapshots").to route_to("inventory_snapshots#index")
    end

    it "routes to #new" do
      expect(:get => "/inventory_snapshots/new").to route_to("inventory_snapshots#new")
    end

    it "routes to #show" do
      expect(:get => "/inventory_snapshots/1").to route_to("inventory_snapshots#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/inventory_snapshots/1/edit").to route_to("inventory_snapshots#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/inventory_snapshots").to route_to("inventory_snapshots#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/inventory_snapshots/1").to route_to("inventory_snapshots#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/inventory_snapshots/1").to route_to("inventory_snapshots#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/inventory_snapshots/1").to route_to("inventory_snapshots#destroy", :id => "1")
    end

  end
end
