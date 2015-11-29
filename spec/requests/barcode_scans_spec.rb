require 'rails_helper'

RSpec.describe "BarcodeScans", type: :request do
  describe "GET /barcode_scans" do
    it "works! (now write some real specs)" do
      get barcode_scans_path
      expect(response).to have_http_status(200)
    end
  end
end
