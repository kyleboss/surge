require 'rails_helper'

RSpec.describe "departures/index", type: :view do
  before(:each) do
    assign(:departures, [
      Departure.create!(
        :location => nil,
        :trackable => nil
      ),
      Departure.create!(
        :location => nil,
        :trackable => nil
      )
    ])
  end

  it "renders a list of departures" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
