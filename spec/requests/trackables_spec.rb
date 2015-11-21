require 'rails_helper'

RSpec.describe "Trackables", type: :request do
  describe "GET /trackables" do
    it "works! (now write some real specs)" do
      get trackables_path
      expect(response).to have_http_status(200)
    end
  end
end
