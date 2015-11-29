require "rails_helper"

RSpec.describe BarcodeScansController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/barcode_scans").to route_to("barcode_scans#index")
    end

    it "routes to #new" do
      expect(:get => "/barcode_scans/new").to route_to("barcode_scans#new")
    end

    it "routes to #show" do
      expect(:get => "/barcode_scans/1").to route_to("barcode_scans#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/barcode_scans/1/edit").to route_to("barcode_scans#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/barcode_scans").to route_to("barcode_scans#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/barcode_scans/1").to route_to("barcode_scans#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/barcode_scans/1").to route_to("barcode_scans#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/barcode_scans/1").to route_to("barcode_scans#destroy", :id => "1")
    end

  end
end
