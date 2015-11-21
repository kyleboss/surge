require 'rails_helper'

RSpec.describe "Arrivals", type: :request do
  describe "GET /arrivals" do
    it "works! (now write some real specs)" do
      get arrivals_path
      expect(response).to have_http_status(200)
    end
  end
end
