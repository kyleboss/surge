require 'rails_helper'

RSpec.describe "antennas/edit", type: :view do
  before(:each) do
    @antenna = assign(:antenna, Antenna.create!(
      :hardware_id => "MyString",
      :location => nil
    ))
  end

  it "renders the edit antenna form" do
    render

    assert_select "form[action=?][method=?]", antenna_path(@antenna), "post" do

      assert_select "input#antenna_hardware_id[name=?]", "antenna[hardware_id]"

      assert_select "input#antenna_location_id[name=?]", "antenna[location_id]"
    end
  end
end
