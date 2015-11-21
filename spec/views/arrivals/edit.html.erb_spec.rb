require 'rails_helper'

RSpec.describe "arrivals/edit", type: :view do
  before(:each) do
    @arrival = assign(:arrival, Arrival.create!(
      :location => nil,
      :trackable => nil
    ))
  end

  it "renders the edit arrival form" do
    render

    assert_select "form[action=?][method=?]", arrival_path(@arrival), "post" do

      assert_select "input#arrival_location_id[name=?]", "arrival[location_id]"

      assert_select "input#arrival_trackable_id[name=?]", "arrival[trackable_id]"
    end
  end
end
