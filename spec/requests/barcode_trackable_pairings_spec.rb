require 'rails_helper'

RSpec.describe "BarcodeTrackablePairings", type: :request do
  describe "GET /barcode_trackable_pairings" do
    it "works! (now write some real specs)" do
      get barcode_trackable_pairings_path
      expect(response).to have_http_status(200)
    end
  end
end
