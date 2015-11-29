require 'rails_helper'

RSpec.describe "Antennas", type: :request do
  describe "GET /antennas" do
    it "works! (now write some real specs)" do
      get antennas_path
      expect(response).to have_http_status(200)
    end
  end
end
