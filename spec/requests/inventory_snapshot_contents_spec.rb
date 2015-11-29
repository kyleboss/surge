require 'rails_helper'

RSpec.describe "InventorySnapshotContents", type: :request do
  describe "GET /inventory_snapshot_contents" do
    it "works! (now write some real specs)" do
      get inventory_snapshot_contents_path
      expect(response).to have_http_status(200)
    end
  end
end
