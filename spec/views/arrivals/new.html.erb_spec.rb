require 'rails_helper'

RSpec.describe "arrivals/new", type: :view do
  before(:each) do
    assign(:arrival, Arrival.new(
      :location => nil,
      :trackable => nil
    ))
  end

  it "renders new arrival form" do
    render

    assert_select "form[action=?][method=?]", arrivals_path, "post" do

      assert_select "input#arrival_location_id[name=?]", "arrival[location_id]"

      assert_select "input#arrival_trackable_id[name=?]", "arrival[trackable_id]"
    end
  end
end
