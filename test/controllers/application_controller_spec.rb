class ApplicationController < ActionController::Base
  class AccessDenied < StandardError; end
  rescue_from AccessDenied, :with => :access_deniedprivate

  def access_denied
    redirect_to "/401.html"
  end
end

require "rails_helper"

RSpec.describe ApplicationController do
  controller do
    def index
      raise ApplicationController::AccessDenied
    end
  end

  describe "handling AccessDenied exceptions" do
    it "redirects to the /401.html page" do
      get :index
      expect(response).to redirect_to("/401.html")
    end
  end
end