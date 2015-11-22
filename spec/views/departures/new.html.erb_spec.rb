require 'rails_helper'

RSpec.describe "departures/new", type: :view do
  before(:each) do
    assign(:departure, Departure.new(
      :location => nil,
      :trackable => nil
    ))
  end

  it "renders new departure form" do
    render

    assert_select "form[action=?][method=?]", departures_path, "post" do

      assert_select "input#departure_location_id[name=?]", "departure[location_id]"

      assert_select "input#departure_trackable_id[name=?]", "departure[trackable_id]"
    end
  end
end
