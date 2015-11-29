require "rails_helper"

RSpec.describe RfidReaderBarcodeReaderPairingsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/rfid_reader_barcode_reader_pairings").to route_to("rfid_reader_barcode_reader_pairings#index")
    end

    it "routes to #new" do
      expect(:get => "/rfid_reader_barcode_reader_pairings/new").to route_to("rfid_reader_barcode_reader_pairings#new")
    end

    it "routes to #show" do
      expect(:get => "/rfid_reader_barcode_reader_pairings/1").to route_to("rfid_reader_barcode_reader_pairings#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/rfid_reader_barcode_reader_pairings/1/edit").to route_to("rfid_reader_barcode_reader_pairings#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/rfid_reader_barcode_reader_pairings").to route_to("rfid_reader_barcode_reader_pairings#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/rfid_reader_barcode_reader_pairings/1").to route_to("rfid_reader_barcode_reader_pairings#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/rfid_reader_barcode_reader_pairings/1").to route_to("rfid_reader_barcode_reader_pairings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/rfid_reader_barcode_reader_pairings/1").to route_to("rfid_reader_barcode_reader_pairings#destroy", :id => "1")
    end

  end
end
