require 'rails_helper'

RSpec.describe "RfidReaders", type: :request do
  describe "GET /rfid_readers" do
    it "works! (now write some real specs)" do
      get rfid_readers_path
      expect(response).to have_http_status(200)
    end
  end
end
