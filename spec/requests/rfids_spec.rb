require 'rails_helper'

RSpec.describe "Rfids", type: :request do
  describe "GET /rfids" do
    it "works! (now write some real specs)" do
      get rfids_path
      expect(response).to have_http_status(200)
    end
  end
end
