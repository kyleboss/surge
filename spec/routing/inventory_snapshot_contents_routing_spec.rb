require "rails_helper"

RSpec.describe InventorySnapshotContentsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/inventory_snapshot_contents").to route_to("inventory_snapshot_contents#index")
    end

    it "routes to #new" do
      expect(:get => "/inventory_snapshot_contents/new").to route_to("inventory_snapshot_contents#new")
    end

    it "routes to #show" do
      expect(:get => "/inventory_snapshot_contents/1").to route_to("inventory_snapshot_contents#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/inventory_snapshot_contents/1/edit").to route_to("inventory_snapshot_contents#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/inventory_snapshot_contents").to route_to("inventory_snapshot_contents#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/inventory_snapshot_contents/1").to route_to("inventory_snapshot_contents#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/inventory_snapshot_contents/1").to route_to("inventory_snapshot_contents#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/inventory_snapshot_contents/1").to route_to("inventory_snapshot_contents#destroy", :id => "1")
    end

  end
end
