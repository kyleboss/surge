require 'rails_helper'

RSpec.describe "RfidReaderBarcodeReaderPairings", type: :request do
  describe "GET /rfid_reader_barcode_reader_pairings" do
    it "works! (now write some real specs)" do
      get rfid_reader_barcode_reader_pairings_path
      expect(response).to have_http_status(200)
    end
  end
end
