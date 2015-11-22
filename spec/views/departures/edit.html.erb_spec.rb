require 'rails_helper'

RSpec.describe "departures/edit", type: :view do
  before(:each) do
    @departure = assign(:departure, Departure.create!(
      :location => nil,
      :trackable => nil
    ))
  end

  it "renders the edit departure form" do
    render

    assert_select "form[action=?][method=?]", departure_path(@departure), "post" do

      assert_select "input#departure_location_id[name=?]", "departure[location_id]"

      assert_select "input#departure_trackable_id[name=?]", "departure[trackable_id]"
    end
  end
end
