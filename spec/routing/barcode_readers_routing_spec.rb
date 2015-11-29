require "rails_helper"

RSpec.describe BarcodeReadersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/barcode_readers").to route_to("barcode_readers#index")
    end

    it "routes to #new" do
      expect(:get => "/barcode_readers/new").to route_to("barcode_readers#new")
    end

    it "routes to #show" do
      expect(:get => "/barcode_readers/1").to route_to("barcode_readers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/barcode_readers/1/edit").to route_to("barcode_readers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/barcode_readers").to route_to("barcode_readers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/barcode_readers/1").to route_to("barcode_readers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/barcode_readers/1").to route_to("barcode_readers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/barcode_readers/1").to route_to("barcode_readers#destroy", :id => "1")
    end

  end
end
