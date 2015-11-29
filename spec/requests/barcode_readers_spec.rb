require 'rails_helper'

RSpec.describe "BarcodeReaders", type: :request do
  describe "GET /barcode_readers" do
    it "works! (now write some real specs)" do
      get barcode_readers_path
      expect(response).to have_http_status(200)
    end
  end
end
