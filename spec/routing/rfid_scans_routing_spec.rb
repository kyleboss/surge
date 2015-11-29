require "rails_helper"

RSpec.describe RfidScansController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/rfid_scans").to route_to("rfid_scans#index")
    end

    it "routes to #new" do
      expect(:get => "/rfid_scans/new").to route_to("rfid_scans#new")
    end

    it "routes to #show" do
      expect(:get => "/rfid_scans/1").to route_to("rfid_scans#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/rfid_scans/1/edit").to route_to("rfid_scans#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/rfid_scans").to route_to("rfid_scans#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/rfid_scans/1").to route_to("rfid_scans#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/rfid_scans/1").to route_to("rfid_scans#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/rfid_scans/1").to route_to("rfid_scans#destroy", :id => "1")
    end

  end
end
