require "rails_helper"

RSpec.describe RfidReadersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/rfid_readers").to route_to("rfid_readers#index")
    end

    it "routes to #new" do
      expect(:get => "/rfid_readers/new").to route_to("rfid_readers#new")
    end

    it "routes to #show" do
      expect(:get => "/rfid_readers/1").to route_to("rfid_readers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/rfid_readers/1/edit").to route_to("rfid_readers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/rfid_readers").to route_to("rfid_readers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/rfid_readers/1").to route_to("rfid_readers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/rfid_readers/1").to route_to("rfid_readers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/rfid_readers/1").to route_to("rfid_readers#destroy", :id => "1")
    end

  end
end
