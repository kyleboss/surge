require 'rails_helper'

RSpec.describe "arrivals/index", type: :view do
  before(:each) do
    assign(:arrivals, [
      Arrival.create!(
        :location => nil,
        :trackable => nil
      ),
      Arrival.create!(
        :location => nil,
        :trackable => nil
      )
    ])
  end

  it "renders a list of arrivals" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
