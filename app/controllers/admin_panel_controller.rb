class AdminPanelController < ApplicationController
  def home
    @searchResults = Search.new('pilia')
  end

  def make_spotlight_search()
    query = params["query"]
    render json: Search.new(query, session[:hospital_id].to_s)
  end
end
