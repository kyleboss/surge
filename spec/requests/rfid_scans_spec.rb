require 'rails_helper'

RSpec.describe "RfidScans", type: :request do
  describe "GET /rfid_scans" do
    it "works! (now write some real specs)" do
      get rfid_scans_path
      expect(response).to have_http_status(200)
    end
  end
end
