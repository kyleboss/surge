require 'rails_helper'

RSpec.describe "InventorySnapshots", type: :request do
  describe "GET /inventory_snapshots" do
    it "works! (now write some real specs)" do
      get inventory_snapshots_path
      expect(response).to have_http_status(200)
    end
  end
end
